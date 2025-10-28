import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:due_kasir/controller/selling/events.dart';
import 'package:due_kasir/controller/venta_controller.dart';
import 'package:due_kasir/controller/tienda_controller.dart';
import 'package:due_kasir/enum/payment_enum.dart';
import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/model/tienda_model.dart';
import 'package:due_kasir/model/venta_model.dart';
import 'package:due_kasir/pages/customer/customer_sheet.dart';
import 'package:due_kasir/service/database.dart';
import 'package:due_kasir/service/get_it.dart';
import 'package:due_kasir/utils/constant.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:usb_esc_printer_windows/usb_esc_printer_windows.dart'
    as usb_esc_printer_windows;

import '../../utils/env.dart';
import '../../widget/peticion_generador.dart';
import 'package:xml/xml.dart';

class SellingRight extends StatefulHookWidget {
  const SellingRight({super.key});

  @override
  SellingRightState createState() => SellingRightState();
}

class SellingRightState extends State<SellingRight> {
  // final formWhatsappKey = GlobalKey<ShadFormState>();
  late Future<CapabilityProfile> _profile;
  bool isConnected = false;
  bool isNeedToPrint = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isWindows) {
      _profile = CapabilityProfile.load();
    } else {
      if (!Platform.isMacOS) checkConnection();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sellingFormKey = useMemoized(GlobalKey<FormState>.new);
    final printName = getIt.get<SellingController>().impresora.watch(context);
    final tienda = tiendaController.tienda.watch(context);
    final tipoPago = getIt.get<SellingController>().tipoPago.watch(context);
    final cliente = getIt.get<SellingController>().cliente.watch(context);
    final usuario = getIt.get<SellingController>().usuario.watch(context);
    final listaCompras = getIt.get<SellingController>().carro.watch(context);
    final consumidorFinal = getIt.get<SellingController>().consumidorFinal.watch(context);
    final cashEditing = useTextEditingController(text: '0');
    final note = useTextEditingController();

    useListenable(cashEditing);
    useListenable(note);
    return SingleChildScrollView(
      child: Form(
        key: sellingFormKey,
        child: ShadCard(
          title: Text('Pago', style: ShadTheme.of(context).textTheme.h4),
          description:
              Text('Resumen de compras ${tienda.value?.razonSocial ?? ''}'),
          footer: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ShadCheckboxFormField(
                  id: 'terms',
                  initialValue: false,
                  inputLabel: const Text('Yo soy responsable'),
                  onChanged: (v) {},
                  inputSublabel: const Text(
                      'He revisado la mercancía y el cliente ha pagado el importe correcto.'),
                  validator: (v) {
                    if (!v) {
                      return 'Debes aceptar los términos y condiciones';
                    }
                    return null;
                  },
                ),
              ),
              ShadButton(
                onPressed: () async {
                  if (usuario == null) {
                    ShadToaster.of(context).show(
                      const ShadToast(
                        backgroundColor: Colors.red,
                        title: Text('Acceso denegado'),
                        description: Text('Debes iniciar sesión para guardar ventas.'),
                      ),
                    );
                    return;
                  }
                  if (sellingFormKey.currentState!.validate() && tienda.hasValue) {
                    if (tipoPago == TypePayment.qris && cliente == null) {
                      if (context.mounted) {
                        ShadToaster.of(context).show(
                          const ShadToast(
                            backgroundColor: Colors.red,
                            title: Text('Cliente requerido'),
                            description: Text('Debe seleccionar un cliente para pagos a crédito.'),
                          ),
                        );
                      }
                      return;
                    }
                    List<ProductItemModel> products = [];
                    double valorAbono = 0;
                    for (ProductoModel p in listaCompras.value!.items) {
                      if(p.codigoPrincipal == '001'){
                        valorAbono += p.precioUnitario*p.cantidad;
                      }
                      products.add(ProductItemModel()
                        ..id = p.id!
                        ..descripcion = p.descripcion
                        ..codigoPrincipal = p.codigoPrincipal
                        ..cantidadProducto = p.cantidadProducto
                        ..precioUnitario = p.precioUnitario
                        ..medida = p.medida
                        ..esSincronizado = p.esSincronizado
                        ..cantidad = p.cantidad);
                    }

                    final newItem = VentaModel(
                      id: DateTime.now().microsecondsSinceEpoch,
                      items: products,
                      usuario: usuario?.id ?? 1,
                      informacion: note.text,
                      descuento: 0,
                      precioTotal: listaCompras.value?.precioTotal ?? 0.0,
                      productoTotal: listaCompras.value?.productoTotal ?? 0,
                      cliente: cliente?.id,
                      fechaCreacion: DateTime.now(),
                      esSincronizado: true,
                    );
                    if (products.isEmpty) return;

                    if (tipoPago == TypePayment.qris && cliente != null) {
                      if (valorAbono != 0) {
                        _mostrarError('No se puede abonar con crédito.');
                        return;
                      }
                      cliente.saldoCredito += listaCompras.value?.precioTotal ?? 0.0;
                    }

                    if(valorAbono > 0){
                      if (cliente == null) {
                        _mostrarError('No se puede abonar a consumidor final.');
                        return;
                      }
                      if (cliente.saldoCredito <= 0) {
                        _mostrarError('Cliente no tiene saldo pendiente.');
                        return;
                      }
                      cliente.saldoCredito -= valorAbono;
                      if (cliente.saldoCredito < 0) cliente.saldoCredito = 0;
                    }

                    await Database().agregarVentaCliente(newItem, cliente).whenComplete(() {
                      if (context.mounted) {
                        ShadToaster.of(context).show(
                          const ShadToast(
                            backgroundColor: Colors.green,
                            title: Text('Venta guardada'),
                            description:
                                Text('La venta se registró correctamente.'),
                          ),
                        );
                      }
                      cashEditing.clear();
                      note.clear();
                      getIt.get<SellingController>().cliente.value = null;
                      getIt.get<SellingController>().tipoPago.value =
                          TypePayment.cash;
                      sellingFormKey.currentState?.reset();
                      getIt
                          .get<SellingController>()
                          .updateBatch(listaCompras.value!.items)
                          .whenComplete(() => getIt
                              .get<SellingController>()
                              .dispatch(CartPaid()));
                    });
                  }
                },
                icon: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.save,
                    size: 16,
                  ),
                ),
                child: const Text('Guardar'),
              ),
              /*ShadButton(
                onPressed: () async {
                  if (sellingFormKey.currentState!.validate() &&
                      tienda.hasValue) {
                    List<ProductItemModel> products = [];
                    for (ProductoModel p in listaCompras.value!.items) {
                      products.add(ProductItemModel()
                        ..id = p.id!
                        ..descripcion = p.descripcion
                        ..codigoPrincipal = p.codigoPrincipal
                        ..codigoAuxiliar = p.codigoAuxiliar
                        ..cantidadProducto = p.cantidadProducto
                        ..precioUnitario = p.precioUnitario
                        ..medida = p.medida
                        ..esSincronizado = p.esSincronizado
                        ..estado = p.estado
                        ..cantidad = p.cantidad
                        ..itbms = p.itbms ?? 0.0);
                    }
                    String? tipoCliente;

                    if (cliente != null) {
                      tipoCliente = cliente.tipoReceptor;
                    } else {
                      tipoCliente = '02';
                    }
                    final newItem = VentaModel(
                      id: DateTime.now().microsecondsSinceEpoch,
                      items: products,
                      usuario: usuario?.id ?? 1,
                      informacion: note.text,
                      descuento: 0,
                      precioTotal: listaCompras.value?.precioTotal ?? 0.0,
                      productoTotal: listaCompras.value?.productoTotal ?? 0,
                      cliente: cliente?.id,
                      fechaCreacion: DateTime.now(),
                      esSincronizado: true,
                      consumidorFinal: consumidorFinal,
                      tipoReceptor: tipoCliente
                    );
                    if (products.isEmpty) return;
                    final numeroFactura = newItem.id.toString();
                    final json = await facturaJsonGenerador(
                      venta: newItem,
                      numeroFactura: numeroFactura,
                    );
                    const apiUrl = Environment.urlApi;
                    const apiKey = Environment.apiKey;
                    final output = await getDownloadsDirectory();
                    final file = File("${output?.path}/$numeroFactura.xml");
                    enviarFacturaAFepApi(
                      url: apiUrl,
                      apiKey: apiKey,
                      jsonBody: json,
                    ).then((resultado) async {
                      final statusCode = resultado['statusCode'];
                      final data = resultado['data'];

                      if (statusCode == 200) {
                        final rawXml = data['xmlFirmado'] ?? '';
                        final document = XmlDocument.parse(rawXml);
                        final xmlFormateado =
                            document.toXmlString(pretty: true, indent: '  ');
                        await file.writeAsString(xmlFormateado);
                        await Database().agregarVenta(newItem).whenComplete(() {
                          if (context.mounted) {
                            ShadToaster.of(context).show(
                              const ShadToast(
                                backgroundColor: Colors.green,
                                title: Text('Venta guardada'),
                                description:
                                Text('La venta se registró correctamente.'),
                              ),
                            );
                          }
                          letsPrint(
                              store: tienda.value!,
                              model: newItem,
                              kasir: usuario?.nombre ?? 'General',
                              tipe: tipoPago,
                              total: cashEditing.text,
                              kembalian: (double.parse(
                                  cashEditing.text.isNotEmpty
                                      ? cashEditing.text
                                      : '0') -
                                  (listaCompras.value?.precioTotal ??
                                      0.0))
                                  .toString(),
                              printName: printName)
                          .whenComplete(() {
                            cashEditing.clear();
                            note.clear();
                            getIt.get<SellingController>().cliente.value = null;
                            getIt.get<SellingController>().tipoPago.value =
                                TypePayment.qris;
                            sellingFormKey.currentState?.reset();
                            getIt
                                .get<SellingController>()
                                .updateBatch(listaCompras.value!.items)
                                .whenComplete(() => getIt
                                .get<SellingController>()
                                .dispatch(CartPaid()));
                            // sendWhatsapp(
                            //   store: store.value!,
                            //   sales: newItem,
                            //   customer: pelanggan,
                            // );
                          });
                        });
                      } else {
                        if (context.mounted) {
                          newItem.esSincronizado = false;
                          await Database().agregarVenta(newItem).whenComplete(() {
                            if (context.mounted) {
                              ShadToaster.of(context).show(
                                const ShadToast(
                                  backgroundColor: Colors.orange,
                                  title: Text('Venta guardada localmente'),
                                  description:
                                  Text('La venta se registró correctamente.'),
                                ),
                              );
                            }
                            cashEditing.clear();
                            note.clear();
                            getIt.get<SellingController>().cliente.value = null;
                            getIt.get<SellingController>().tipoPago.value =
                                TypePayment.qris;
                            sellingFormKey.currentState?.reset();
                            getIt
                                .get<SellingController>()
                                .updateBatch(listaCompras.value!.items)
                                .whenComplete(() => getIt
                                .get<SellingController>()
                                .dispatch(CartPaid()));
                          });
                        }
                        log('Error del servidor ($statusCode)');
                        log('Detalles: ${data['error'] ?? 'Sin detalles'}');
                      }
                    }).catchError((e) {
                      if (context.mounted) {
                        ShadToaster.of(context).show(
                          ShadToast(
                            backgroundColor: Colors.red,
                            title: const Text('Error'),
                            description: Text('Error de red o interno: $e'),
                          ),
                        );
                      }
                      log('Ocurrió un error: $e');
                    });
                  }
                },
                icon: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    isConnected && !Platform.isWindows || printName.isNotEmpty
                        ? Icons.print
                        : Icons.print_disabled,
                    size: 16,
                  ),
                ),
                child: const Text('Imprimir'),
              ),*/
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(usuario?.nombre ?? '----------'),
                  subtitle: const Text('Usuario'),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () => context.push('/home'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    cliente?.nombre ?? consumidorFinal ?? 'Consumidor Final',
                  ),
                  subtitle: const Text('Cliente'),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () {
                    showShadSheet(
                      side: ShadSheetSide.right,
                      context: context,
                      builder: (context) => const CustomerSheet(),
                    );
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Total'),
                  trailing: Text(
                    currency.format(listaCompras.value?.precioTotal ?? 0),
                    style: ShadTheme.of(context).textTheme.large,
                  ),
                ),
                ShadRadioGroupFormField<TypePayment>(
                  label: const Text('Tipo pago'),
                  initialValue: tipoPago,
                  onChanged: (TypePayment? val) {
                    getIt.get<SellingController>().tipoPago.value = val!;
                  },
                  items: TypePayment.values.map(
                    (e) => ShadRadio(
                      value: e,
                      label: Text(e.message),
                    ),
                  ),
                  validator: (v) {
                    if (v == null) {
                      return 'Debe seleccionar un tipo de notificación.';
                    }
                    return null;
                  },
                ),
                if (tipoPago == TypePayment.cash)
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Monto en efectivo'),
                            ShadInput(
                              controller: cashEditing,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d{0,2}$'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Devolver'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              currency.format(
                                math.max(
                                  0,
                                  (double.tryParse(cashEditing.text) ?? 0) -
                                      (listaCompras.value?.precioTotal ?? 0.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ))
                    ],
                  ),
                const Text('Notas'),
                ShadInput(
                  controller: note,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void sendWhatsapp(
  //     {required StoreModel store,
  //     required PenjualanModel sales,
  //     CustomerModel? customer}) {
  //   showShadDialog(
  //     context: context,
  //     builder: (context) => ShadDialog(
  //       title: const Text('Kirim ke Whatsaap?'),
  //       description:
  //           const Text("Rincian ringkas akan di kirim ke nomor whatsapp"),
  //       content: ShadForm(
  //         key: formWhatsappKey,
  //         child: Container(
  //           width: 375,
  //           padding: const EdgeInsets.symmetric(vertical: 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: [
  //               ShadInputFormField(
  //                 id: "name",
  //                 label: const Text('Nama'),
  //                 initialValue: customer?.nama,
  //                 validator: (v) {
  //                   if (v.length < 2) {
  //                     return 'Name must be at least 2 characters.';
  //                   }
  //                   return null;
  //                 },
  //               ),
  //               ShadInputFormField(
  //                 id: "phone",
  //                 label: const Text('Phone'),
  //                 initialValue: customer?.phone,
  //                 description: const Text(
  //                     'Pastikan nomor tidak ada angka 0 di depan dan berawalan 62 (tanpa tanda +)'),
  //                 validator: (v) {
  //                   if (v.length < 2) {
  //                     return 'Phone must valid';
  //                   }
  //                   return null;
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       actions: [
  //         ShadButton(
  //             onPressed: () => context.pop(), text: const Text('Cancel')),
  //         ShadButton(
  //             onPressed: () async {
  //               final newCustomer = CustomerModel(
  //                 nama: formWhatsappKey.currentState!.value['name'],
  //                 status: true,
  //                 phone: formWhatsappKey.currentState!.value['phone'],
  //                 keterangan: 'Add From Seling Page',
  //                 masuk: DateTime.now(),
  //                 createdAt: DateTime.now(),
  //               );

  //               Database().addNewCustomer(newCustomer).whenComplete(() {
  //                 customerController.customer.refresh();
  //               });

  //               try {
  //                 await DioClient.instance.dio.post('/messages', data: {
  //                   "messaging_product": "whatsapp",
  //                   "to": formWhatsappKey.currentState!.value['phone'],
  //                   "type": "template",
  //                   "template": {
  //                     "name": "order",
  //                     "language": {"code": "id"},
  //                     'components': [
  //                       {
  //                         "type": "body",
  //                         "parameters": [
  //                           {
  //                             "type": "text",
  //                             "text":
  //                                 formWhatsappKey.currentState!.value['name']
  //                           },
  //                           {"type": "text", "text": store.title},
  //                           {
  //                             "type": "text",
  //                             "text": currency.format(sales.totalHarga)
  //                           },
  //                           {"type": "text", "text": store.footer}
  //                         ],
  //                       }
  //                     ]
  //                   }
  //                 });
  //                 if (context.mounted) {
  //                   context.pop();
  //                 }
  //               } on DioException catch (e) {
  //                 print(e);
  //               }
  //             },
  //             text: const Text('Kirim'))
  //       ],
  //     ),
  //   );
  // }

  void _mostrarError(String mensaje) {
    ShadToaster.of(context).show(
      ShadToast(
        backgroundColor: Colors.red,
        title: const Text('Error'),
        description: Text(mensaje),
      ),
    );
  }

  void checkConnection() async {
    isConnected = await PrintBluetoothThermal.connectionStatus;
    setState(() {});
  }

  Future<Uint8List> loadImageFromAssets(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

  Future<void> letsPrint({
    required TiendaModel store,
    required VentaModel model,
    required String kasir,
    required TypePayment tipe,
    String? total,
    String? kembalian,
    String? printName,
  }) async {
    final profile = await CapabilityProfile.load();
    late CapabilityProfile winProfile;
    if (Platform.isWindows) {
      winProfile = await _profile;
    }
    final generator =
        Generator(PaperSize.mm80, Platform.isWindows ? winProfile : profile);
    List<int> bytes = [];
    // final Uint8List data = await loadImageFromAssets('assets/logo.jpeg');

    // img.Image originalImage = img.decodeImage(data)!;

    // bytes += generator.imageRaster(originalImage, align: PosAlign.center);
    // bytes += generator.feed(1);
    // bytes += generator.imageRaster(image);
    bytes += generator.text(store.razonSocial,
        styles: const PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));
    bytes += generator.feed(1);
    bytes += generator.text(store.direccion,
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.text(store.telefono,
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.feed(1);
    bytes += generator.hr();
    bytes += generator.text(
        'Date/Time : ${DateFormat.yMd().add_jm().format(DateTime.now())}');
    bytes += generator.text('Cashier   : $kasir');
    bytes += generator.feed(1);

    bytes += [27, 97, 0];
    bytes += generator.row([
      PosColumn(
        text: 'QTY',
        width: 1,
        styles: const PosStyles(
          align: PosAlign.left,
          bold: true,
        ),
      ),
      PosColumn(
        text: 'S/T/DESCRIPTION',
        width: 9,
        styles: const PosStyles(
          align: PosAlign.left,
          bold: true,
        ),
      ),
      PosColumn(
        text: 'TOTAL',
        width: 2,
        styles: const PosStyles(
          align: PosAlign.left,
          bold: true,
        ),
      ),
    ]);
    bytes += generator.hr();
    for (ProductItemModel i in model.items) {
      bytes += generator.text(i.descripcion!);
      bytes += generator.row([
        PosColumn(
          text:
              //'${i.descuentoPorcentaje == null || i.descuentoPorcentaje == 0.0 ? '' : 'Disc'} ${i.cantidad} x ${i.descuentoPorcentaje == null || i.descuentoPorcentaje == 0.0 ? i.precioVenta : '${i.precioVenta} >> ${i.precioVenta! - i.precioVenta! * (i.descuentoPorcentaje! / 100)}'}',
              '${i.precioUnitario}',
          width: 6,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: '${i.cantidad! * i.precioUnitario!}',
          width: 6,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }

    bytes += generator.hr();
    bytes += [27, 97, 2];
    bytes += generator.text(
      'Total ${currency.format(model.precioTotal)}',
      styles: const PosStyles(
        height: PosTextSize.size2,
        bold: true,
      ),
    );
    bytes += [27, 97, 1];
    bytes += generator.text('Transaction details');
    bytes += generator.text('*****************************************');
    bytes += generator.row([
      PosColumn(
        text: 'Bayar',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: tipe == TypePayment.cash ? total! : tipe.name,
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    if (tipe == TypePayment.cash) {
      bytes += generator.row([
        PosColumn(
          text: 'Kembali',
          width: 6,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: kembalian ?? '0',
          width: 6,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }
    bytes += generator.feed(2);
    if (store.identificacion != null) {
      bytes += generator.text(store.identificacion!,
          styles: const PosStyles(align: PosAlign.center));
    }
    if (store.correo != null) {
      bytes += generator.text(store.correo!,
          styles: const PosStyles(align: PosAlign.center));
    }
    bytes += generator.feed(2);
    bytes += generator.cut();
    bytes += generator.drawer();
    if (Platform.isWindows) {
      await usb_esc_printer_windows.sendPrintRequest(
          bytes, printName ?? 'Xprinter XP-T371U');
    } else {
      await PrintBluetoothThermal.writeBytes(bytes);
    }
  }
}

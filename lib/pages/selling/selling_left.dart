import 'package:due_kasir/controller/selling/events.dart';
import 'package:due_kasir/controller/venta_controller.dart';
import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:due_kasir/service/get_it.dart';
import 'package:due_kasir/utils/constant.dart';
import 'package:due_kasir/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class SellingLeft extends HookWidget {
  const SellingLeft({super.key});

  @override
  Widget build(context) {
    final editingBarcode =
        useTextEditingController(text: 'Escanear código ...');
    final list = getIt.get<SellingController>().carro.watch(context);
    final isSearch = getIt.get<SellingController>().isSearch.watch(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (PlatformExtension.isMobile)
                  ShadButton.ghost(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () async {
                      var res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage(),
                          ));
                      final data = await Database().buscarPorBarcode(res);
                      if (data != null) {
                        editingBarcode.text = res;
                        getIt
                            .get<SellingController>()
                            .dispatch(CartItemAdded(data));
                      } else {
                        if (context.mounted) {
                          ShadToaster.of(context).show(
                            ShadToast(
                              backgroundColor: Colors.red,
                              title: const Text('Producto no encontrado'),
                              description:
                                  const Text('Puedes añadir en Productos'),
                              action: ShadButton.outline(
                                child: const Text('Ok'),
                                onPressed: () => ShadToaster.of(context).hide(),
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                IconButton(
                  color: !isSearch ? Colors.blue : null,
                  onPressed: () =>
                      getIt.get<SellingController>().isSearch.value = !isSearch,
                  icon: const Icon(Icons.qr_code_scanner),
                ),
                if (isSearch)
                  Expanded(
                    child: Autocomplete<ProductoModel>(
                      optionsBuilder:
                          (TextEditingValue textEditingValue) async {
                        if (textEditingValue.text == '') {
                          return const Iterable<ProductoModel>.empty();
                        }
                        final data = await Database()
                            .obtenerProductosPorCampo(value: textEditingValue.text);
                        return data;
                      },
                      onSelected: (ProductoModel value) {
                        getIt
                            .get<SellingController>()
                            .dispatch(CartItemAdded(value));
                      },
                      displayStringForOption: (option) => '',
                      optionsViewBuilder: (context, onSelected, options) {
                        return Material(
                          child: ListView(
                            children: options
                                .map(
                                  (option) => GestureDetector(
                                    onTap: () {
                                      if (option.cantidadProducto == 0) return;
                                      onSelected(option);
                                    },
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor:
                                            option.cantidadProducto == 0
                                                ? Colors.red
                                                : null,
                                        child: Text(
                                          option.cantidadProducto.toString(),
                                        ),
                                      ),
                                      title: Text('${option.descripcion} - ${option.medida}'),
                                      subtitle: Row(
                                        children: [
                                          Text(currency
                                              .format(option.precioUnitario)),
                                          Text(' - ${option.codigoPrincipal}')
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      },
                      fieldViewBuilder: (context, textEditingController,
                              focusNode, onFieldSubmitted) =>
                          TextFormField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onEditingComplete: onFieldSubmitted,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Buscar',
                          suffixIcon: IconButton(
                            onPressed: () => textEditingController.clear(),
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  BarcodeKeyboardListener(
                    bufferDuration: const Duration(milliseconds: 200),
                    onBarcodeScanned: (barcode) async {
                      final data = await Database()
                          .buscarPorBarcode(barcode.replaceAll('½', '-'));
                      if (data != null) {
                        editingBarcode.text = barcode.replaceAll('½', '-');
                        getIt
                            .get<SellingController>()
                            .dispatch(CartItemAdded(data));
                      } else {
                        if (context.mounted) {
                          ShadToaster.of(context).show(
                            ShadToast(
                              backgroundColor: Colors.red,
                              title: const Text('Producto no encontrado'),
                              description:
                                  const Text('Puedes añadir en Productos'),
                              action: ShadButton.outline(
                                child: const Text('Ok'),
                                onPressed: () => ShadToaster.of(context).hide(),
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: editingBarcode,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            list.map(
              data: (item) => Column(
                children: item.items
                    .map(
                      (val) => Container(
                        decoration: val.cantidad > val.cantidadProducto
                            ? BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0),
                              )
                            : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (val.cantidad > val.cantidadProducto)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8.0),
                                child: Text(
                                  '¡Agotado! Disponible${val.cantidadProducto}',
                                  style: ShadTheme.of(context)
                                      .textTheme
                                      .small
                                      .copyWith(color: Colors.red),
                                ),
                              ),
                            ListTile(
                              title: Text(val.descripcion),
                              subtitle: Row(
                                children: [
                                  Text(currency.format(val.precioUnitario))
                                ],
                              ),
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: HookBuilder(builder: (context) {
                                        final controller =
                                            useTextEditingController(
                                                text: val.cantidad.toString());

                                        useEffect(() {
                                          controller.text =
                                              val.cantidad.toString();
                                          return null;
                                        }, [val.cantidad]);

                                        return TextFormField(
                                          controller: controller,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 6),
                                          ),
                                          onChanged: (value) {
                                            final nuevaCantidad = int.tryParse(value);
                                            if (nuevaCantidad != null && nuevaCantidad > 0) {
                                              getIt.get<SellingController>().dispatch(
                                                CartItemCantidadActualizada(val, nuevaCantidad),
                                              );
                                            }
                                          },
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                              leading: IconButton(
                                  onPressed: () => showShadDialog(
                                        context: context,
                                        builder: (context) => ShadDialog.alert(
                                          title: const Text(
                                              '¿Estás seguro que deseas eliminarlo?'),
                                          description: const Padding(
                                            padding: EdgeInsets.only(bottom: 8),
                                            child: Text(
                                              'Esta acción no se puede deshacer, los datos se eliminarán de la lista.',
                                            ),
                                          ),
                                          actions: [
                                            ShadButton.outline(
                                              child: const Text('Cancelar'),
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(false),
                                            ),
                                            ShadButton(
                                                child: const Text('Continuar'),
                                                onPressed: () {
                                                  getIt
                                                      .get<SellingController>()
                                                      .dispatch(
                                                          CartItemRemoved(val));
                                                  Navigator.of(context)
                                                      .pop(true);
                                                }),
                                          ],
                                        ),
                                      ),
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              error: (e, __) => Text('$__'),
              loading: () => const Text('Cargando'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:due_kasir/controller/producto_controller.dart';
import 'package:due_kasir/main.dart';
import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../enum/estado_enum.dart';

class InventoryForm extends HookWidget {
  InventoryForm({super.key});

  @override
  Widget build(context) {
    final inventoryFormKey = useMemoized(GlobalKey<FormState>.new);
    final item = productoController.productoSelected.watch(context);
    final editingDescripcion =
        useTextEditingController(text: item?.descripcion ?? '');
    final editingCodigoPrincipal =
        useTextEditingController(text: item?.codigoPrincipal ?? '');
    final editingMedida = useTextEditingController(text: item?.medida ?? '');
    final editingPrecioUnitario = useTextEditingController(
        text: (item?.precioUnitario ?? '0').toString());
    final editingStock = useTextEditingController(
        text: (item?.cantidadProducto ?? 0).toString());

    useListenable(editingDescripcion);
    useListenable(editingCodigoPrincipal);
    useListenable(editingMedida);
    useListenable(editingPrecioUnitario);
    useListenable(editingStock);

    final isConnected = isDeviceConnected.watch(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: inventoryFormKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.circle,
                        color: isConnected ? Colors.green : null),
                    ShadButton.ghost(
                      child: const Text('Cerrar'),
                      onPressed: () {
                        productoController.productoSelected.value = null;
                        context.pop();
                      },
                    ),
                  ],
                ),
                ShadInputFormField(
                  controller: editingDescripcion,
                  validator: (val) =>
                      val.isEmpty == true ? 'Descripción es requerida' : null,
                  label: const Text('Descripción'),
                  placeholder: const Text('Ej: Celular'),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ShadInputFormField(
                        controller: editingCodigoPrincipal,
                        validator: (val) => val.isEmpty == true
                            ? 'Código Principal es requerido'
                            : null,
                        label: const Text('Código Principal'),
                        placeholder: const Text('Ej: 001'),
                        enabled: editingCodigoPrincipal.text != '001',
                      ),
                    ),
                    BarcodeKeyboardListener(
                      bufferDuration: const Duration(milliseconds: 200),
                      onBarcodeScanned: (barcode) async {
                        if (editingCodigoPrincipal.text != '001') {
                          editingCodigoPrincipal.text = barcode.replaceAll('½', '-');
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: ShadButton.ghost(
                          icon: Icon(Icons.barcode_reader),
                        ),
                      ),
                    ),
                    ShadButton.ghost(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () async {
                        var res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const SimpleBarcodeScannerPage(),
                            ));
                        editingCodigoPrincipal.text = res;
                      },
                      enabled: editingCodigoPrincipal.text != '001',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ShadInputFormField(
                        controller: editingPrecioUnitario,
                        keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}$'),
                            ),
                          ],
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Precio Unitario es requerido';
                          }
                          final parsed = double.tryParse(value.replaceAll(',', '.'));
                          if (parsed == null) {
                            return 'Ingrese un número válido';
                          }
                          if (parsed <= 0) {
                            return 'El valor debe ser mayor que cero';
                          }
                          return null;
                        },
                        label: const Text('Precio Unitario'),
                      ),
                    ),
                    Expanded(
                      child: ShadInputFormField(
                        controller: editingStock,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        label: const Text('Cantidad'),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ShadInputFormField(
                        controller: editingMedida,
                        label: const Text('Medida'),
                        placeholder: const Text('Ej: S/M/L 50ml/100ml'),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (item != null)
                        if (editingCodigoPrincipal.text != '001')
                          ShadButton.destructive(
                            child: const Text('Borrar'),
                            onPressed: () {
                              Database()
                                  .eliminarProducto(item.id!)
                                  .whenComplete(() async {
                                await productoController.productos.refresh();
                                if (context.mounted) Navigator.pop(context);
                              });
                            },
                          ),
                      ShadButton(
                        child: const Text('Guardar'),
                        onPressed: () {
                          if (!inventoryFormKey.currentState!.validate()) {
                            return;
                          } else {
                            if (item != null) {
                              final updateitem = ProductoModel(
                                  id: item.id,
                                  descripcion: editingDescripcion.text
                                      .replaceAll(',', ' '),
                                  codigoPrincipal: editingCodigoPrincipal.text,
                                  precioUnitario:
                                      double.parse(editingPrecioUnitario.text),
                                  medida: editingMedida.text,
                                  cantidadProducto:
                                      int.tryParse(editingStock.text) ?? 0,
                                  fechaCreacion: item.fechaCreacion,
                                  cantidad: 1);

                              Database()
                                  .actualizarProducto(updateitem)
                                  .whenComplete(() {
                                Future.delayed(Durations.short1).then((_) {
                                  if (context.mounted) context.pop();
                                  productoController.productos.refresh();
                                  productoController.productoSelected.value =
                                      null;
                                });
                              });
                            } else {
                              final newItem = ProductoModel(
                                  id: DateTime.now().microsecondsSinceEpoch,
                                  descripcion: editingDescripcion.text
                                      .replaceAll(',', ' '),
                                  codigoPrincipal: editingCodigoPrincipal.text,
                                  precioUnitario:
                                      double.parse(editingPrecioUnitario.text),
                                  medida: editingMedida.text,
                                  cantidadProducto:
                                      int.tryParse(editingStock.text) ?? 0,
                                  fechaCreacion: DateTime.now(),
                                  cantidad: 1);

                              Database().agregarProducto(newItem).whenComplete(() {
                                productoController.productos.refresh();
                                if (context.mounted) context.pop();
                              });
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

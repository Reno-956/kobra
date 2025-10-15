import 'dart:io';

import 'package:csv/csv.dart';
import 'package:due_kasir/controller/producto_controller.dart';
import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/utils/constant.dart';
import 'package:due_kasir/utils/extension.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

class InventoryList extends HookWidget {
  const InventoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final inventory = productoController.productos.watch(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (val) {
                      productoController.searchInventory.value = val;
                      productoController.productos.refresh();
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Buscar',
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (item) async {
                    if (item == 'upload') {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        File file = File(result.files.single.path!);
                        productoController.csvFile.value = file;
                        if (context.mounted) context.push('/csv-preview');
                      }
                    } else if (item == 'download') {
                      if (inventory.hasValue &&
                          inventory.value?.isNotEmpty == true) {
                        List<List<dynamic>> rows = [];
                        rows.add([
                          "id",
                          "descripcion",
                          "codigoPrincipal",
                          "cantidadProducto",
                          "precioUnitario",
                          "cantidad"
                        ]);
                        for (ProductoModel map in inventory.value!) {
                          rows.add([
                            map.id,
                            map.descripcion,
                            map.codigoPrincipal,
                            map.cantidadProducto,
                            map.medida,
                            map.precioUnitario,
                            map.cantidad,
                          ]);
                        }
                        final directory =
                            await getApplicationDocumentsDirectory();
                        String csv = const ListToCsvConverter().convert(rows);
                        String filePath = "${directory.path}/due-kasir.csv";

                        File file = File(filePath);
                        File fileCsv = await file.writeAsString(csv);
                        if (!fileCsv.existsSync()) {
                          fileCsv.create(recursive: true);
                        }
                        if (Platform.isWindows) {
                          FileSaver.instance
                              .saveFile(
                                  name:
                                      'due-kasir-${DateTime.now().millisecondsSinceEpoch}.csv',
                                  file: fileCsv)
                              .then(
                                (_) => const ShadToast(
                                  title: Text('Exportación CSV exitosa!'),
                                  description: Text(
                                      'Archivo CSV ya en su carpeta de descargas'),
                                ),
                              );
                        } else {
                          await FileSaver.instance.saveAs(
                              name: 'due-kasir',
                              file: fileCsv,
                              ext: 'csv',
                              mimeType: MimeType.csv);
                        }
                      }
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'download',
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.download),
                          SizedBox(width: 8),
                          Text('Descargar'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'upload',
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.upload),
                          SizedBox(width: 8),
                          Text('Cargar'),
                        ],
                      ),
                    ),
                  ],
                  icon: const Icon(Icons.more_vert_outlined),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          inventory.map(
              data: (items) {
                if (items.isEmpty) {
                  return const Center(child: Text('No hay información'));
                }
                if (PlatformExtension.isMobile) {
                  return Column(
                    children: items
                        .map((item) => ListTile(
                              leading: Text(item.codigoPrincipal),
                              title: Text('${item.descripcion} - ${item.medida}'),
                              subtitle: Text(
                                currency.format(item.precioUnitario),
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: const Icon(Icons.arrow_right_outlined),
                              onTap: () {
                                productoController.productoSelected.value =
                                    item;
                                context.go('/inventory/form');
                              },
                            ))
                        .toList(),
                  );
                }
                return DataTable(
                  columns: const [
                    DataColumn(label: Text('Código Principal')),
                    DataColumn(label: Text('Decripción')),
                    DataColumn(label: Text('Medida')),
                    DataColumn(label: Text('Precio Unitario')),
                    DataColumn(label: Text('Cantidad')),
                    DataColumn(label: Text('Editar')),
                  ],
                  dataRowMaxHeight: 80.0,
                  rows: items
                      .map((item) => DataRow(cells: [
                            DataCell(Text(item.codigoPrincipal)),
                            DataCell(Text(item.descripcion)),
                            DataCell(Text(item.medida.toString())),
                            DataCell(Text(item.precioUnitario.toString())),
                            DataCell(Text(item.cantidadProducto.toString())),
                            DataCell(
                              const Icon(Icons.more_horiz),
                              onTap: () {
                                productoController.productoSelected.value =
                                    item;
                                context.go('/inventory/form');
                              },
                            ),
                          ]))
                      .toList(),
                );
              },
              error: (e, __) => Text('$e'),
              loading: () => const Center(child: CircularProgressIndicator())),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

import 'dart:convert' show utf8;
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:due_kasir/controller/producto_controller.dart';
import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

class CsvPreview extends StatefulWidget {
  const CsvPreview({super.key});

  @override
  State<CsvPreview> createState() => _CsvPreviewState();
}

class _CsvPreviewState extends State<CsvPreview> {
  Future<List<ProductoModel>> data() async {
    final csv = productoController.csvFile.watch(context);
    final input = File(csv!.path).openRead();
    return await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .skip(1)
        .map((val) {
      return ProductoModel(
          descripcion: val[1],
          codigoPrincipal: val[2].toString(),
          precioUnitario: double.tryParse(val[3].toString()) ?? 0,
          medida: val[4].toString(),
          //codigoAuxiliar: val[3] == 'null' ? null : val[3],
          cantidadProducto: val[5] ?? 0,
          esSincronizado: false,
          cantidad: 1);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectAll = productoController.selectAll.watch(context);
    final d = productoController.listItemFromCsv.watch(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ShadButton(
            onPressed: () => d.isNotEmpty
                ? Database().agregarProductosLista(d).whenComplete(() {
                    productoController.listItemFromCsv.clear();
                    productoController.productos.refresh();
                    if (context.mounted) context.pop();
                  })
                : null,
            icon: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.import_export,
                size: 16,
              ),
            ),
            child: const Text('Exportar'),
          )
        ],
      ),
      body: FutureBuilder(
        future: data(),
        builder: (context, res) {
          if (res.data?.isNotEmpty == true) {
            final data = (res.data ?? []);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataTable(
                    columns: [
                      DataColumn(
                        label: ShadCheckbox(
                          value: selectAll,
                          onChanged: (v) {
                            if (v) {
                              productoController.listItemFromCsv.addAll(data);
                            } else {
                              productoController.listItemFromCsv.clear();
                            }
                            productoController.selectAll.value = v;
                          },
                        ),
                      ),
                      const DataColumn(label: Text('Descrición')),
                      const DataColumn(label: Text('Código Principal')),
                      const DataColumn(label: Text('Precio Unitario')),
                      const DataColumn(label: Text('Cantidad')),
                      const DataColumn(label: Text('Medida')),
                      const DataColumn(label: Text('Cantidad')),
                    ],
                    rows: [
                      for (var item in data)
                        DataRow(cells: [
                          DataCell(Text(item.descripcion.toString())),
                          DataCell(
                            ShadCheckbox(
                              value: d
                                          .firstWhereOrNull((val) =>
                                              val.codigoPrincipal ==
                                              item.codigoPrincipal)
                                          ?.codigoPrincipal !=
                                      item.codigoPrincipal
                                  ? false
                                  : true,
                              onChanged: (v) {
                                if (d
                                        .firstWhereOrNull((val) =>
                                            val.codigoPrincipal ==
                                            item.codigoPrincipal)
                                        ?.codigoPrincipal ==
                                    item.codigoPrincipal) {
                                  productoController.listItemFromCsv
                                      .removeWhere((val) =>
                                          val.codigoPrincipal ==
                                          item.codigoPrincipal);
                                } else {
                                  productoController.listItemFromCsv.add(item);
                                }
                              },
                            ),
                          ),
                          DataCell(Text(item.precioUnitario.toString())),
                          DataCell(Text(item.cantidadProducto.toString())),
                          DataCell(Text(item.medida.toString())),
                          DataCell(Text(item.cantidad.toString())),
                        ])
                    ],
                  ),
                ],
              ),
            );
          }
          return Text('No hay información ${res.error}');
        },
      ),
    );
  }
}

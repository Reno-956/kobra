import 'package:collection/collection.dart';
import 'package:due_kasir/model/venta_model.dart';
import 'package:due_kasir/utils/constant.dart';
import 'package:flutter/material.dart';

class ReportBestSellerAll extends StatelessWidget {
  final List<ProductItemModel> items;

  const ReportBestSellerAll({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos vendidos'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ...ListTile.divideTiles(
              context: context,
              tiles: items
                  .sorted((a, b) => b.cantidad!.compareTo(a.cantidad!))
                  .map(
                    (n) => ListTile(
                      title: Text('${n.descripcion} ${n.medida}'),
                      subtitle:
                          Text('${currency.format(n.precioUnitario)} - ${n.codigoPrincipal}'),
                      trailing: Text(' ${n.cantidad} Vendidos'),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

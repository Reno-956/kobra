import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../controller/producto_controller.dart';

class ReportOutOfStock extends StatelessWidget {
  final List<ProductoModel> items;

  const ReportOutOfStock({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos Agotados'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ...ListTile.divideTiles(
              context: context,
              tiles: items
                  .map(
                    (n) => ListTile(
                      title: Text('${n.descripcion} ${n.medida}'),
                      subtitle: Text(
                          '${currency.format(n.precioUnitario)} - ${n.codigoPrincipal}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(' ${n.cantidadProducto}'),
                          IconButton(
                            onPressed: () {
                              productoController.productoSelected.value = n;
                              context.go('/inventory/form');
                            },
                            icon: const Icon(Icons.arrow_right),
                          ),
                        ],
                      ),
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

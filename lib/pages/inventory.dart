import 'package:due_kasir/controller/producto_controller.dart';
import 'package:due_kasir/pages/drawer.dart';
import 'package:due_kasir/pages/inventory/inventory_list.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Productos'),
        centerTitle: false,
        actions: [
          ShadButton.ghost(
            onPressed: () {
              productoController.productos.refresh();
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.refresh,
                size: 16,
              ),
            ),
            child: const Text('Refrescar'),
          ),
          PopupMenuButton<String>(
            onSelected: (item) async {
              if (item == 'clear') {
                showShadDialog(
                  context: context,
                  builder: (context) => ShadDialog.alert(
                    title: const Text('¿Estás seguro?'),
                    description: const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Esta acción borrara tus datos localles',
                      ),
                    ),
                    actions: [
                      ShadButton.outline(
                        child: const Text('Cancelar'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      ShadButton(
                        child: const Text('Continuar'),
                        onPressed: () {
                          Database().limpiarProducto().whenComplete(() {
                            if (context.mounted) context.go('/');
                          });
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'clear',
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.clear_all),
                    SizedBox(width: 8),
                    Text('Borrar'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: const InventoryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productoController.productoSelected.value = null;
          context.push('/inventory/form');
        },
        tooltip: 'Agregar',
        child: const Icon(Icons.add),
      ),
    );
  }
}

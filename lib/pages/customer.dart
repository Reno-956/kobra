import 'package:due_kasir/controller/cliente_controller.dart';
import 'package:due_kasir/pages/customer/customer_list.dart';
import 'package:due_kasir/pages/drawer.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Customer extends HookWidget {
  const Customer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Clientes'),
        centerTitle: false,
        actions: [
          ShadButton.ghost(
            onPressed: () {
              clienteController.clientes.refresh();
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
        ],
      ),
      body: const CustomerList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clienteController.customerSelected.value = null;
          context.push('/customer/form');
        },
        tooltip: 'Agregar',
        child: const Icon(Icons.add),
      ),
    );
  }
}

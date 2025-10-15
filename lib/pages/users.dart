import 'package:due_kasir/controller/usuario_controller.dart';
import 'package:due_kasir/pages/drawer.dart';
import 'package:due_kasir/pages/users/user_list.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Usuarios'),
        centerTitle: false,
        actions: [
          ShadButton.ghost(
            onPressed: () {
              usuarioController.usuarios.refresh();
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
      body: const UserList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          usuarioController.usuarioSelected.value = null;
          context.push('/users/form');
        },
        tooltip: 'Agregar',
        child: const Icon(Icons.add),
      ),
    );
  }
}

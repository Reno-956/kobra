import 'package:due_kasir/controller/cliente_controller.dart';
import 'package:due_kasir/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

class CustomerList extends HookWidget {
  const CustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    final customers = clienteController.clientes.watch(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onChanged: (val) {
                clienteController.searchCustomer.value = val;
                clienteController.clientes.refresh();
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar',
              ),
            ),
            const SizedBox(height: 20),
            customers.map(
              data: (customers) {
                if (customers.isEmpty) {
                  return const Center(child: Text('No hay información'));
                }
                if (PlatformExtension.isMobile) {
                  return Column(
                    children: customers.map((user) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(user.nombre),
                        subtitle: Text(
                            '${user.identificacion ?? '-'}\nCorreo: ${user.correo ?? '-'}'),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_outlined),
                        onTap: () {
                          clienteController.customerSelected.value = user;
                          context.push('/customer/form');
                        },
                      );
                    }).toList(),
                  );
                }
                return DataTable(
                  columns: const [
                    DataColumn(label: Text('Identificación')),
                    DataColumn(label: Text('Razon Social/Nombre')),
                    DataColumn(label: Text('Teléfono')),
                    DataColumn(label: Text('Descripción')),
                    DataColumn(label: Text('Correo')),
                    DataColumn(label: Text('Editar')),
                  ],
                  rows: customers.map((user) {
                    return DataRow(cells: [
                      DataCell(Text(user.identificacion.toString())),
                      DataCell(Text(user.nombre)),
                      DataCell(Text(user.telefono ?? '-')),
                      DataCell(Text(user.direccion ?? '-')),
                      DataCell(Text(user.correo ?? '')),
                      DataCell(
                        const Icon(Icons.keyboard_arrow_right_outlined),
                        onTap: () {
                          clienteController.customerSelected.value = user;
                          context.push('/customer/form');
                        },
                      ),
                    ]);
                  }).toList(),
                );
              },
              error: (e, __) => Text('$e'),
              loading: () => const CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:due_kasir/controller/cliente_controller.dart';
import 'package:due_kasir/controller/venta_controller.dart';
import 'package:due_kasir/service/get_it.dart';
import 'package:due_kasir/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

class CustomerSheet extends HookWidget {
  const CustomerSheet({super.key, this.side});

  final ShadSheetSide? side;

  @override
  Widget build(BuildContext context) {
    final searchCustomer = useTextEditingController();
    final customers = clienteController.clientes.watch(context);
    return ShadSheet(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
              context.push('/customer/form');
            },
            icon: const Icon(Icons.add),
          ),
          const Text('Agregar Cliente'),
        ],
      ),
      description: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Seleccione un cliente"),
          ShadButton.outline(
            child: const Text('Final'),
            onPressed: () {
              getIt.get<SellingController>().cliente.value = null;
              context.pop();
            },
          )
        ],
      ),
      child: SizedBox(
        width: side == ShadSheetSide.bottom || side == ShadSheetSide.top
            ? MediaQuery.sizeOf(context).width
            : null,
        child: Material(
          child: Padding(
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
                      data: (customer) {
                        if (PlatformExtension.isMobile) {
                          return Column(
                            children: customer.map((user) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(user.nombre),
                                subtitle: Text(
                                  '${user.identificacion ?? '-'}\nCorreo: ${user.correo ?? '-'}',
                                ),
                                trailing: const Icon(
                                        Icons.keyboard_arrow_right_outlined),
                                onTap: () {
                                        getIt
                                            .get<SellingController>()
                                            .cliente
                                            .value = user;
                                        context.pop();
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
                            DataColumn(label: Text('Correo')),
                            DataColumn(label: Text('Acción')),
                          ],
                          rows: customer.map((user) {
                            return DataRow(cells: [
                              DataCell(Text(user.identificacion.toString())),
                              DataCell(Text(user.nombre)),
                              DataCell(Text((user.telefono ?? '').toString())),
                              DataCell(Text((user.correo ?? '').toString())),
                              DataCell(
                                ShadButton.outline(
                                        child: const Text('Seleccionar'),
                                        onPressed: () {
                                          getIt
                                              .get<SellingController>()
                                              .cliente
                                              .value = user;
                                          context.pop();
                                        },
                                      ),
                              ),
                            ]);
                          }).toList(),
                        );
                      },
                      error: (e, __) => Text('$e'),
                      loading: () => const CircularProgressIndicator())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

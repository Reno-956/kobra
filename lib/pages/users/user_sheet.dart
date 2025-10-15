import 'package:due_kasir/controller/usuario_controller.dart';
import 'package:due_kasir/model/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

class UserSheet extends StatelessWidget {
  const UserSheet({super.key, this.side});

  final ShadSheetSide? side;

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      title: const Text('Lista Clientes'),
      description: const Text("Seleccione un cliente"),
      child: SizedBox(
        width: side == ShadSheetSide.bottom || side == ShadSheetSide.top
            ? MediaQuery.sizeOf(context).width
            : null,
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Buscar',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Watch((context) => DataTable(
                        columns: const [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Role')),
                          DataColumn(label: Text('Detail')),
                        ],
                        rows: usuarioController.usuarios.value.map(
                            loading: () => [
                                  const DataRow(cells: [
                                    DataCell(Text('Loading')),
                                    DataCell(Text('')),
                                    DataCell(Text('')),
                                    DataCell(Text('')),
                                    DataCell(Text(''))
                                  ])
                                ],
                            error: (e) => Text('Error $e'),
                            data: (data) {
                              return [
                                for (UsuarioModel user in data)
                                  DataRow(cells: [
                                    DataCell(Text(user.id.toString())),
                                    DataCell(Text(user.nombre)),
                                    DataCell(Text(user.perfil ?? '')),
                                    DataCell(
                                      const Icon(
                                          Icons.keyboard_arrow_right_outlined),
                                      onTap: () {
                                        usuarioController
                                            .usuarioSelected.value = user;
                                        context.push('/users/form');
                                      },
                                    ),
                                  ])
                              ];
                            }),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

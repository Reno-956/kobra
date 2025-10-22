import 'package:due_kasir/controller/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

import '../../service/database.dart';
import '../../utils/extension.dart';

class UserList extends HookWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final users = usuarioController.usuarios.watch(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onChanged: (val) {
                usuarioController.searchUser.value = val;
                usuarioController.usuarios.refresh();
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar',
              ),
            ),
            const SizedBox(height: 20),
            users.map(
              data: (users) {
                if (users.isEmpty) {
                  return const Center(child: Text('No hay información'));
                }
                if (PlatformExtension.isMobile) {
                  return Column(
                    children: users.map((user) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(user.nombre),
                        subtitle: Text(
                            '${user.identificacion ?? '-'}\nUsuario: ${user.correo ?? '-'}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.keyboard_arrow_right_outlined),
                              onPressed: () {
                                usuarioController.usuarioSelected.value = user;
                                context.push('/users/form');
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.lock_reset, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text("Confirmar"),
                                    content: Text(
                                      "¿Deseas restablecer la contraseña de ${user.nombre}?\n"
                                          "La nueva será su identificación.",
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text("Cancelar"),
                                        onPressed: () => Navigator.pop(ctx),
                                      ),
                                      TextButton(
                                        child: const Text("Aceptar"),
                                        onPressed: () async {
                                          Navigator.pop(ctx);
                                          await Database()
                                              .actualizarClaveUsuarioPorUserId(user.id!, user.identificacion);

                                          if (context.mounted) {
                                            ShadToaster.of(context).show(
                                              const ShadToast(
                                                backgroundColor: Colors.green,
                                                title: Text("Contraseña restablecida"),
                                                description: Text(
                                                  "La nueva contraseña es la identificación del usuario.",
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }
                return DataTable(
                  columns: const [
                    DataColumn(label: Text('Identificación')),
                    DataColumn(label: Text('Usuario')),
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Perfil')),
                    DataColumn(label: Text('Editar')),
                    DataColumn(label: Text('Restablecer')),
                  ],
                  rows: users.map((user) {
                    return DataRow(cells: [
                      DataCell(Text(user.identificacion.toString())),
                      DataCell(Text(user.correo ?? '')),
                      DataCell(Text(user.nombre)),
                      DataCell(Text(user.perfil ?? '')),
                      DataCell(
                        const Icon(Icons.keyboard_arrow_right_outlined),
                        onTap: () {
                          usuarioController.usuarioSelected.value = user;
                          context.push('/users/form');
                        },
                      ),
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.lock_reset, color: Colors.red),
                          tooltip: "Restablecer contraseña",
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Confirmar"),
                                content: Text(
                                  "¿Seguro que deseas restablecer la contraseña de ${user.nombre}?\n"
                                      "La nueva será su número de identificación.",
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text("Cancelar"),
                                    onPressed: () => Navigator.pop(ctx),
                                  ),
                                  TextButton(
                                    child: const Text("Aceptar"),
                                    onPressed: () async {
                                      Navigator.pop(ctx);
                                      await Database()
                                          .actualizarClaveUsuarioPorUserId(user.id!, user.identificacion);

                                      if (context.mounted) {
                                        ShadToaster.of(context).show(
                                          const ShadToast(
                                            backgroundColor: Colors.green,
                                            title: Text("Contraseña restablecida"),
                                            description: Text(
                                              "La nueva contraseña es la identificación del usuario.",
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
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

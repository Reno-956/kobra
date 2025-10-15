import 'package:due_kasir/controller/auth_controller.dart';
import 'package:due_kasir/controller/usuario_controller.dart';
import 'package:due_kasir/model/auth_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

import '../../controller/venta_controller.dart';
import '../../service/get_it.dart';

class UsersSheet extends StatelessWidget {
  const UsersSheet({super.key, this.side});

  final ShadSheetSide? side;

  @override
  Widget build(BuildContext context) {
    final auth = authController.usuarioLogin.watch(context);
    final users = usuarioController.usuarios.watch(context);
    return SafeArea(
      child: ShadSheet(
        title: const Text('Lista de perfiles'),
        description: const Text(
            "Haz cambios en tu perfil aquí. Guarda los cambios cuando termines."),
        child: SizedBox(
          width: side == ShadSheetSide.bottom || side == ShadSheetSide.top
              ? MediaQuery.sizeOf(context).width
              : null,
          child: Material(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: users.value != null
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: users.value!
                          .map((p) => ListTile(
                                title: Text(p.nombre),
                                subtitle: Text(p.perfil),
                                trailing: Icon(
                                    auth.value?.user.value?.id == p.id
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank),
                                onTap: () async {
                                  final controller = TextEditingController();

                                  final result = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Confirmar cambio'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Ingresa la contraseña para ${p.nombre}'),
                                            const SizedBox(height: 10),
                                            TextField(
                                              controller: controller,
                                              obscureText: true,
                                              decoration: const InputDecoration(
                                                labelText: 'Contraseña',
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(null),
                                            child: const Text('Cancelar'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              final password = controller.text.trim();
                                              if (password == p.identificacion) {
                                                Navigator.of(context).pop(true);
                                              } else {
                                                Navigator.of(context).pop(false);
                                              }
                                            },
                                            child: const Text('Confirmar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );

                                  if (result != null && result == true) {
                                    if (auth.hasValue) {
                                      final user = AuthModel()
                                        ..id = auth.value!.id
                                        ..user.value = p;
                                      await Database()
                                          .cambiarUser(user)
                                          .whenComplete(() => authController.usuarioLogin.refresh());
                                    } else {
                                      final user = AuthModel()
                                        ..user.value = p
                                        ..createdAt = DateTime.now();
                                      await Database().loginUser(user);
                                    }

                                    authController.usuarioLogin.refresh();
                                    getIt.get<SellingController>().usuario.value = p;
                                    if (context.mounted) context.pop();
                                  } else if (result != null && result == false) {
                                    ShadToaster.of(context).show(
                                      const ShadToast(
                                        backgroundColor: Colors.red,
                                        description: Text('Contraseña incorrecta'),
                                      ),
                                    );
                                  }
                                },
                          ))
                          .toList(),
                  )
                  : const Text('No hay usuarios'),
            ),
          ),
        ),
      ),
    );
  }
}

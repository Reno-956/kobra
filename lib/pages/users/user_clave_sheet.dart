import 'package:due_kasir/controller/auth_controller.dart';
import 'package:due_kasir/controller/usuario_controller.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

import '../../utils/password_utils.dart';

class UserClaveSheet extends StatefulWidget {
  const UserClaveSheet({super.key});

  @override
  State<UserClaveSheet> createState() => _UserClaveSheetState();
}

class _UserClaveSheetState extends State<UserClaveSheet> {
  final _formKey = GlobalKey<FormState>();
  final _actualController = TextEditingController();
  final _nuevaController = TextEditingController();
  final _confirmarController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final auth = authController.usuarioLogin.watch(context);
    final user = auth.value?.user.value;

    return AlertDialog(
      title: const Text('Cambiar contraseña'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _actualController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña actual'),
              validator: (v) => (v == null || v.isEmpty)
                  ? 'Ingrese la contraseña actual'
                  : null,
            ),
            TextFormField(
              controller: _nuevaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Nueva contraseña'),
              validator: (v) => (v == null || v.length < 6)
                  ? 'Debe tener al menos 6 caracteres'
                  : null,
            ),
            TextFormField(
              controller: _confirmarController,
              obscureText: true,
              decoration:
              const InputDecoration(labelText: 'Confirmar nueva contraseña'),
              validator: (v) => v != _nuevaController.text
                  ? 'Las contraseñas no coinciden'
                  : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _isLoading
              ? null
              : () async {
            if (!_formKey.currentState!.validate()) return;

            setState(() => _isLoading = true);

            final claveActual =
            await Database().obtenerClaveUsuarioPorUserId(user!.id!);

            final passwordCorrecto = verifyPassword(
              _actualController.text,
              claveActual!.salt,
              claveActual!.claveHash,
            );

            if (!passwordCorrecto) {
              setState(() => _isLoading = false);
              if (context.mounted) {
                ShadToaster.of(context).show(
                  const ShadToast(
                    backgroundColor: Colors.red,
                    title: Text('Contraseña incorrecta'),
                    description:
                    Text('La contraseña actual no es válida.'),
                  ),
                );
              }
              return;
            }

            await Database()
                .actualizarClaveUsuarioPorUserId(user!.id!, _nuevaController.text);

            setState(() => _isLoading = false);
            if (context.mounted) {
              Navigator.pop(context);
              ShadToaster.of(context).show(
                const ShadToast(
                  backgroundColor: Colors.green,
                  title: Text('Contraseña actualizada'),
                  description: Text('El cambio se realizó con éxito.'),
                ),
              );
            }
          },
          child: _isLoading
              ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
              : const Text('Guardar'),
        ),
      ],
    );
  }
}

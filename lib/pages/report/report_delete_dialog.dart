import 'package:due_kasir/controller/report_controller.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

import '../../controller/auth_controller.dart';

class ReportDeleteDialog extends StatefulWidget {
  final int id;

  const ReportDeleteDialog({super.key, required this.id});

  @override
  State<ReportDeleteDialog> createState() => _ReportDeleteDialogState();
}

class _ReportDeleteDialogState extends State<ReportDeleteDialog> {
  final reportFormKey = GlobalKey<ShadFormState>();
  final TextEditingController _password = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final auth = authController.usuarioLogin.watch(context);
    final usuario = auth.value?.user.value;
    return ShadForm(
      key: reportFormKey,
      child: ShadDialog(
        title: const Text('Borrar Reporte'),
        description: const Text(
            "¿Está seguro de que desea eliminar este reporte?, esta acción no se puede revertir."),
        actions: [
          ShadButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          ShadButton(
              onPressed: () async {
                if (reportFormKey.currentState!.validate()) {
                  final isValid = await Database().validarClaveUsuario(usuario!.correo! , _password.text);
                  if (isValid) {
                    await Database().eliminarVenta(widget.id);
                    await reportController.reporte.refresh();
                    await reportController.reporteHoy.refresh();
                    await reportController.reporteAyer.refresh();
                    if (context.mounted) {
                      context.pop();
                    }
                  } else {
                    ShadToaster.of(context).show(
                      const ShadToast(
                        backgroundColor: Colors.red,
                        description: Text(
                          'Contraseña incorrecta!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                }
              },
              child: const Text('Borrar'))
        ],
        child: Container(
          width: 375,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ShadInputFormField(
            controller: _password,
            label: const Text('Contraseña'),
            placeholder: const Text('Ingrese su contraseña'),
            validator: (v) {
              if (v.length < 2) {
                return 'Contraseña debe tener al menos 2 caracteres';
              }
              return null;
            },
            obscureText: obscure,
            prefix: const Padding(
              padding: EdgeInsets.all(4.0),
              child: ShadImage.square(size: 16, LucideIcons.lock),
            ),
            suffix: ShadButton(
              width: 24,
              height: 24,
              padding: EdgeInsets.zero,
              decoration: ShadDecoration.none,
              icon: ShadImage.square(
                size: 16,
                obscure ? LucideIcons.eyeOff : LucideIcons.eye,
              ),
              onPressed: () {
                setState(() => obscure = !obscure);
              },
            ),
          ),
        ),
      ),
    );
  }
}

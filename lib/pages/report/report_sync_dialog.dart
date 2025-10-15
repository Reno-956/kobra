import 'dart:developer';
import 'dart:io';

import 'package:due_kasir/controller/report_controller.dart';
import 'package:due_kasir/model/usuario_model.dart';
import 'package:due_kasir/model/venta_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../controller/selling/venta_sincro.dart';
import '../../controller/venta_controller.dart';
import '../../service/get_it.dart';
import '../../utils/date_utils.dart';
import '../../utils/env.dart';
import '../../widget/peticion_generador.dart';
import 'package:xml/xml.dart';

class ReportSyncDialog extends StatefulWidget {
  final int id;
  final VentaModel detail;

  const ReportSyncDialog({super.key, required this.id, required this.detail});

  @override
  State<ReportSyncDialog> createState() => _ReportSyncDialogState();
}

class _ReportSyncDialogState extends State<ReportSyncDialog> {
  final reportFormKey = GlobalKey<ShadFormState>();
  final TextEditingController _password = TextEditingController();
  final user = getIt.get<SellingController>().usuario.value;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: reportFormKey,
      child: ShadDialog(
        title: const Text('Sincronizar venta'),
        description: const Text(
            "¿Estás seguro de sincronizar este elemento? Esta acción no se puede deshacer."),
        actions: [
          ShadButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          ShadButton(
              onPressed: () async {
                if (reportFormKey.currentState!.validate()) {
                  if (_password.text == user!.identificacion) {
                    final sincronizado = await VentaSincro.procesarVenta(widget.detail);

                    if (sincronizado) {
                      if (context.mounted) {
                        ShadToaster.of(context).show(
                          const ShadToast(
                            backgroundColor: Colors.green,
                            title: Text('Venta guardada'),
                            description:
                            Text('La venta se registró correctamente.'),
                          ),
                        );
                      }
                    } else {
                      if (context.mounted) {
                        ShadToaster.of(context).show(
                          const ShadToast(
                            backgroundColor: Colors.red,
                            title: Text('Error al guardar'),
                            description:
                            Text('Error al guardar'),
                          ),
                        );
                      }
                    }
                    //await Database().updatePenjualan(widget.detail);
                    await reportController.reporte.refresh();
                    await reportController.reporteHoy.refresh();
                    await reportController.reporteAyer.refresh();
                    await reportController.reporteAgotado.refresh();
                    if (context.mounted) {
                      context.pop();
                    }
                  } else {
                    ShadToaster.of(context).show(
                      const ShadToast(
                        backgroundColor: Colors.red,
                        description: Text(
                          'Contraseña Incorrecta!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                }
              },
              child: const Text('Sincronizar'))
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
                return 'Contraseñadebe tener al menos 2 caracteres.';
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

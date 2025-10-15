import 'package:due_kasir/controller/tienda_controller.dart';
import 'package:due_kasir/model/tienda_model.dart';
import 'package:due_kasir/pages/drawer.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

import '../controller/auth_controller.dart';
import '../enum/perfil_enum.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final _storeFormKey = GlobalKey<FormState>();

  bool initialized = false;
  final razonSocial = TextEditingController();
  final direccion = TextEditingController();
  final telefono = TextEditingController();
  final identificacion = TextEditingController();
  final correo = TextEditingController();

  @override
  void dispose() {
    razonSocial.dispose();
    direccion.dispose();
    telefono.dispose();
    identificacion.dispose();
    correo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = tiendaController.tienda.watch(context);
    final theme = ShadTheme.of(context);
    final auth = authController.usuarioLogin.watch(context);
    final perfilUsuario = auth.value?.user.value?.perfil;

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Tienda'),
        centerTitle: false,
      ),
      body: Form(
        key: _storeFormKey,
        child: store.map(
          data: (t) {
            if (!initialized && t != null) {
              razonSocial.text = t.razonSocial ?? '';
              direccion.text = t.direccion ?? '';
              telefono.text = t.telefono ?? '';
              identificacion.text = t.identificacion ?? '';
              correo.text = t.correo ?? '';
              initialized = true;
            }

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShadCard(
                      width: 350,
                      title: Text('Cuenta Login', style: theme.textTheme.h4),
                      description: const Text(
                          'Asegúrate de haber iniciado sesión con tu cuenta'),
                      footer: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ShadButton(
                            child: const Text('Guardar'),
                            onPressed: () {
                              if (_storeFormKey.currentState!.validate()) {
                                if (store.value != null) {
                                  final val = TiendaModel(
                                    id: store.value!.id,
                                    razonSocial: razonSocial.text,
                                    direccion: direccion.text,
                                    telefono: telefono.text,
                                    identificacion: identificacion.text,
                                    correo: correo.text,
                                  );
                                  Database().agregarTienda(val).whenComplete(
                                    () {
                                      tiendaController.tienda.refresh();
                                      context.pop();
                                      ShadToaster.of(context).show(
                                        const ShadToast(
                                          backgroundColor: Colors.green,
                                          description: Text(
                                            'Tienda actualizada exitosamente',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  final val = TiendaModel(
                                    id: DateTime.now().microsecondsSinceEpoch,
                                    razonSocial: razonSocial.text,
                                    direccion: direccion.text,
                                    telefono: telefono.text,
                                    identificacion: identificacion.text,
                                    correo: correo.text,
                                  );
                                  Database().agregarTienda(val).whenComplete(
                                    () {
                                      tiendaController.tienda.refresh();
                                      context.pop();
                                      ShadToaster.of(context).show(
                                        const ShadToast(
                                          backgroundColor: Colors.green,
                                          description: Text(
                                            'Tienda guardada exitosamente',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            },
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ShadInputFormField(
                              controller: identificacion,
                              validator: (val) => val.isEmpty == true
                                  ? 'Identificación es requerido'
                                  : null,
                              label: const Text('Identificación'),
                              placeholder: const Text('Ej: RUC'),
                              readOnly: perfilUsuario == TipoPerfil.user.message || perfilUsuario == TipoPerfil.admin.message,
                            ),
                            ShadInputFormField(
                              label: const Text('Razón Social'),
                              placeholder: const Text('Tienda'),
                              controller: razonSocial,
                              validator: (v) {
                                if (v.length < 2) {
                                  return 'La Razón Social debe tener al menos 2 caracteres.';
                                }
                                return null;
                              },
                              readOnly: perfilUsuario == TipoPerfil.user.message,
                            ),
                            ShadInputFormField(
                              label: const Text('Dirección Matriz'),
                              placeholder: const Text('Ej: Av. Pradera'),
                              controller: direccion,
                              maxLines: 2,
                              validator: (v) {
                                if (v.length < 2) {
                                  return 'Dirección debe tener al menos 2 caracteres.';
                                }
                                return null;
                              },
                              readOnly: perfilUsuario == TipoPerfil.user.message,
                            ),
                            ShadInputFormField(
                              controller: correo,
                              validator: (val) =>
                                val.isEmpty == true ? 'Correo is requirido' : null,
                              label: const Text('Correo'),
                              placeholder: const Text('usuario@ejemplo.com'),
                              keyboardType: TextInputType.emailAddress,
                              readOnly: perfilUsuario == TipoPerfil.user.message,
                            ),
                            ShadInputFormField(
                              label: const Text('Teléfono'),
                              placeholder:
                                  const Text('Ej: 022222222'),
                              controller: telefono,
                              validator: (v) {
                                if (v.length < 2) {
                                  return 'Teléfono debe tener al menos 2 caracteres.';
                                }
                                return null;
                              },
                              readOnly: perfilUsuario == TipoPerfil.user.message,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, __) => Text('$error'),
          loading: () => const Center(
            child: Text('Cargando...'),
          ),
        ),
      ),
    );
  }
}

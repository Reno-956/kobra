import 'package:due_kasir/controller/usuario_controller.dart';
import 'package:due_kasir/enum/estado_enum.dart';
import 'package:due_kasir/model/usuario_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

import '../../controller/auth_controller.dart';
import '../../enum/perfil_enum.dart';
import '../../model/clave_usuario_model.dart';
import '../../utils/password_utils.dart';

class UserForm extends HookWidget {
  UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final userFormKey = useMemoized(GlobalKey<FormState>.new);
    final user = usuarioController.usuarioSelected.watch(context);
    final editingNombre = useTextEditingController(text: user?.nombre ?? '');
    final editingTelefono =
        useTextEditingController(text: (user?.telefono ?? '').toString());
    final editingIdentificacion =
        useTextEditingController(text: user?.identificacion ?? '');
    final editingCorreo =
        useTextEditingController(text: (user?.correo ?? '').toString());
    final perfil = useState(user?.perfil ?? TipoPerfil.user.message);
    final auth = authController.usuarioLogin.watch(context);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: userFormKey,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: ShadButton.ghost(
                      child: const Text('Cerrar'),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  ShadInputFormField(
                    controller: editingIdentificacion,
                    validator: (val) => val.isEmpty == true
                        ? 'Identificación es requerido'
                        : null,
                    label: const Text('Identificación'),
                    placeholder: const Text('Ej: CI/RUC'),
                  ),
                  ShadInputFormField(
                    controller: editingNombre,
                    validator: (val) =>
                        val.isEmpty == true ? 'Nombre es requerido' : null,
                    label: const Text('Nombre'),
                    placeholder: const Text('Ej: Usuario'),
                  ),
                  ShadInputFormField(
                    controller: editingTelefono,
                    label: const Text('Teléfono'),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    placeholder: const Text('Ej: 02222222'),
                  ),
                  ShadInputFormField(
                    controller: editingCorreo,
                    validator: (val) =>
                        val.isEmpty == true ? 'Correo is requirido' : null,
                    label: const Text('Correo'),
                    placeholder: const Text('usuario@ejemplo.com'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Perfil',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ShadSelect<String>(
                              initialValue: user?.perfil,
                              placeholder: const Text('Selecciona un perfil'),
                              /*options: TipoPerfil.values.map((e) {
                                return ShadOption(
                                  value: e.message,
                                  child: Text(e.message),
                                );
                              }).toList(),*/
                              options: (auth.value?.user.value?.perfil == TipoPerfil.superAdmin.message
                                  ? TipoPerfil.values
                                  : TipoPerfil.values.where((e) => e != TipoPerfil.superAdmin)
                              ).map((e) => ShadOption<String>(
                                value: e.message,
                                child: Text(e.message),
                              )).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  perfil.value = value;
                                }
                              },
                              selectedOptionBuilder: (context, value) {
                                final selectedEnum = TipoPerfil.values.firstWhere(
                                      (e) => e.message == value,
                                  orElse: () => TipoPerfil.user,
                                );
                                return Text(selectedEnum.message);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (user != null)
                          ShadButton.destructive(
                            child: const Text('Borrar'),
                            onPressed: () {
                              Database().borrarUser(user.id!).whenComplete(() {
                                usuarioController.usuarios.refresh();
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ShadButton(
                          child: const Text('Guardar cambios'),
                          onPressed: () {
                            if (userFormKey.currentState!.validate()) {
                              if (user != null) {
                                final updateUser = UsuarioModel(
                                  id: user.id,
                                  nombre: editingNombre.text,
                                  identificacion: editingIdentificacion.text,
                                  telefono: editingTelefono.text,
                                  correo: editingCorreo.text,
                                  perfil: perfil.value,
                                  fechaCreacion: user.fechaCreacion,
                                );
                                Database()
                                    .actualizarUser(updateUser)
                                    .whenComplete(() {
                                  Future.delayed(Durations.short1).then((_) {
                                    usuarioController.usuarios.refresh();
                                    context.pop();
                                  });
                                });
                              } else {
                                final newUser = UsuarioModel(
                                  id: DateTime.now().microsecondsSinceEpoch,
                                  nombre: editingNombre.text,
                                  identificacion: editingIdentificacion.text,
                                  telefono: editingTelefono.text,
                                  correo: editingCorreo.text,
                                  perfil: perfil.value,
                                  fechaCreacion: DateTime.now(),
                                );

                                Database().agregarUser(newUser);
                                final salt = generateSaltBase64();
                                final hash = hashPasswordBase64(newUser.identificacion, saltBase64: salt);

                                final clave = ClaveUsuarioModel()
                                  ..user.value = newUser
                                  ..salt = salt
                                  ..claveHash = hash
                                  ..fechaCreacion = DateTime.now();

                                Database().agregarClaveUsuario(clave).whenComplete(() {
                                  usuarioController.usuarios.refresh();
                                  context.pop();
                                });
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

import '../controller/auth_controller.dart';
import '../controller/venta_controller.dart';
import '../model/auth_model.dart';
import '../service/database.dart';
import '../service/get_it.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<ShadFormState>();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final auth = authController.usuarioLogin.watch(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          ShadButton.outline(
            child: const Text('Atrás'),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadInputFormField(
                  id: 'email',
                  label: const Text('Correo'),
                  placeholder: const Text('usuario@ejemplo.com'),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Correo no válido';
                    }
                    return null;
                  },
                ),
                ShadInputFormField(
                  id: 'password',
                  placeholder: const Text('Contraseña'),
                  obscureText: obscure,
                  prefix: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: ShadImage.square(size: 16, LucideIcons.lock),
                  ),
                  /*validator: (v) {
                    if (v.length < 5) {
                      return 'Debe contener al menos 5 caracteres';
                    }
                    return null;
                  },*/
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
                const SizedBox(height: 16),
                ShadButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    if (formKey.currentState!.saveAndValidate()) {
                      final email = formKey.currentState!.value['email'];
                      final password = formKey.currentState!.value['password'];

                      final isValid = await Database().validarClaveUsuario(email, password);
                      if (isValid) {
                        final usuario = await Database()
                            .obtenerUserPorEmailYIde(email);

                        if (usuario != null) {
                          if (auth.hasValue) {
                            final user = AuthModel()
                              ..id = auth.value!.id
                              ..user.value = usuario;
                            await Database().cambiarUser(user).whenComplete(
                                  () => authController.usuarioLogin.refresh(),
                            );
                          } else {
                            final user = AuthModel()
                              ..user.value = usuario
                              ..createdAt = DateTime.now();
                            await Database().loginUser(user);
                          }
                          authController.usuarioLogin.refresh();
                          getIt.get<SellingController>().usuario.value = usuario;

                          if (context.mounted) {
                            ShadToaster.of(context).show(
                              const ShadToast(
                                backgroundColor: Colors.green,
                                description: Text(
                                  'Bienvenido',
                                  style: TextStyle(color: Colors.white),
                                ),
                                title: Text('Login exitoso'),
                              ),
                            );
                            context.go('/home');
                          }
                        }
                      } else {
                        if (context.mounted) {
                          ShadToaster.of(context).show(
                            const ShadToast(
                              backgroundColor: Colors.red,
                              title: Text('Error de login'),
                              description:
                                  Text('Usuario o contraseña incorrectos'),
                            ),
                          );
                        }
                      }
                    }
                  },
                ),
                /*Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: '¿No tienes cuenta?',
                        style: ShadTheme.of(context).textTheme.muted,
                      ),
                      TextSpan(
                        text: ' Registrate',
                        style: ShadTheme.of(context).textTheme.p,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/register'),
                      ),
                    ]),
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

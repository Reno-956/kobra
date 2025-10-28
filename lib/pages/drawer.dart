import 'package:due_kasir/controller/auth_controller.dart';
import 'package:due_kasir/service/database.dart';
import 'package:due_kasir/utils/date_utils.dart';
import 'package:due_kasir/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../enum/perfil_enum.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = authController.usuarioLogin.watch(context);
    final user = auth.value?.user.value;
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? const Color(0xff164863)
                      : const Color(0xffF6F6F6)),
              accountName: Text(
                  '${user?.nombre ?? ""} - ${user?.perfil ?? ""}',
                  style: ShadTheme.of(context).textTheme.h3),
              accountEmail: Text(user?.correo ?? '',
                  style: ShadTheme.of(context).textTheme.muted),
              currentAccountPictureSize: const Size(200, 80),
              currentAccountPicture: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kobra',
                    style: ShadTheme.of(context).textTheme.h1.copyWith(
                      fontSize: PlatformExtension.isMobile ? 24 : 32,)
                  ),
                  Text(
                    dateWithTime.format(DateTime.now()),
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                ],
              ),
            ),
            if (user != null) ...[
              ListTile(
                title: const Text('Vender'),
                leading: const Icon(Icons.sell_outlined),
                onTap: () => context.go('/'),
              ),
              ListTile(
                title: const Text('Reporte'),
                leading: const Icon(Icons.home_repair_service_outlined),
                onTap: () => context.go('/report'),
              ),
              ListTile(
                title: const Text('Productos'),
                leading: const Icon(Icons.inventory),
                onTap: () => context.go('/inventory'),
              ),
              if (user?.perfil != TipoPerfil.user.message)
                ListTile(
                  title: const Text('Usuarios'),
                  leading: const Icon(Icons.person_2),
                  onTap: () => context.go('/users'),
                ),
              ListTile(
                title: const Text('Clientes'),
                leading: const Icon(Icons.people),
                onTap: () {
                  context.go('/customer');
                },
              ),
            ],
            /*ListTile(
              title: const Text('Request'),
              leading: const Icon(Icons.edit_note),
              onTap: () => context.go('/request'),
            ),
            ListTile(
              title: const Text('Rent'),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {
                context.go('/rent');
              },
            ),
            ListTile(
              title: const Text('Due Payment'),
              leading: const Icon(Icons.payment),
              onTap: () {
                context.go('/due-payment');
              },
            ),
            ListTile(
              title: const Text('Presence'),
              leading: const Icon(Icons.adobe_sharp),
              onTap: () {
                context.go('/presence');
              },
            ),
            ListTile(
              title: const Text('Expenses'),
              leading: const Icon(Icons.monetization_on),
              onTap: () {
                context.go('/expenses');
              },
            ),
            ListTile(
              title: const Text('Salaries'),
              leading: const Icon(Icons.account_balance),
              onTap: () {
                context.go('/salaries');
              },
            ),*/
            ListTile(
              title: const Text('Cuenta'),
              leading: const Icon(Icons.account_circle),
              trailing: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (item) async {
                  if (item == 'restore') {
                    ShadToaster.of(context).show(
                      ShadToast(
                        title: const Text('Restaurar Backup?'),
                        description:
                            const Text('Seleccione el archivo isar para restaurar'),
                        action: ShadButton.outline(
                          child: const Text('Seleccionar'),
                          onPressed: () => Database().restoreDB().whenComplete(
                            () {
                              if (context.mounted) {
                                ShadToaster.of(context).show(
                                  const ShadToast(
                                    title: Text('Restauración Existosa!'),
                                    description: Text(
                                        'Asegúrese de que se importen todos los datos'),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  } else if (item == 'login') {
                    context.pop();
                    context.push('/login');
                  } else if (item == 'backup') {
                    context.pop();
                    Database().createBackUp().then((_) => const ShadToast(
                          title: Text('Backup Existosa!'),
                          description: Text('Todos tus datos en la carpeta de descargas'),
                        ));
                  } else if (item == 'clear') {
                    context.pop();
                    showShadDialog(
                      context: context,
                      builder: (context) => ShadDialog.alert(
                        title: const Text('¿Estás completamente seguro?'),
                        description: const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Esta acción no se puede deshacer. Eliminará permanentemente sus datos..',
                          ),
                        ),
                        actions: [
                          ShadButton.outline(
                            child: const Text('Cancelar'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          ShadButton(
                            child: const Text('Continuar'),
                            onPressed: () async {
                              await Database().clearAllData().whenComplete(() {
                                if (context.mounted) {
                                  Navigator.of(context).pop(true);
                                  context.go('/');
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  } else if (item == 'logout') {
                    context.pop();
                    await Database().logoutUser();
                    authController.usuarioLogin.refresh();
                  } else if (item == 'sync') {
                    context.pop();
                    context.go('/sync');
                  } else if (item == 'store') {
                    context.pop();
                    context.go('/home/store');
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  if (user != null) ...[
                    if (user?.perfil != TipoPerfil.user.message)
                      const PopupMenuItem<String>(
                        value: 'restore',
                        child: Text('Restaurar'),
                      ),
                    if (user?.perfil != TipoPerfil.user.message)
                      const PopupMenuItem<String>(
                        value: 'backup',
                        child: Text('Backup'),
                      ),
                    if (user?.perfil != TipoPerfil.user.message)
                      const PopupMenuItem<String>(
                        value: 'clear',
                        child: Text('Resetear'),
                      ),
                    const PopupMenuItem<String>(
                      value: 'store',
                      child: Text('Tienda'),
                    ),
                  ],
                  if (user == null)
                    const PopupMenuItem<String>(
                      value: 'login',
                      child: Text('Login'),
                    )
                  else ...[
                    /*const PopupMenuItem<String>(
                      value: 'sync',
                      child: Text('Sincronizar'),
                    ),*/
                    const PopupMenuItem<String>(
                      value: 'logout',
                      child: Text('Logout'),
                    ),
                  ]
                ],
              ),
              onTap: () => context.go('/home'),
            ),
          ],
        ),
      ),
    );
  }
}

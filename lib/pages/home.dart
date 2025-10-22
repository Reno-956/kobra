import 'package:due_kasir/controller/auth_controller.dart';
import 'package:due_kasir/pages/drawer.dart';
import 'package:due_kasir/pages/home/users_sheet.dart';
import 'package:due_kasir/pages/users/user_clave_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../service/database.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final auth = authController.usuarioLogin.watch(context);
    final user = auth.value?.user.value;
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Cuenta'),
        centerTitle: false,
        actions: [
          ShadButton.ghost(
            icon: const Padding(
                padding: EdgeInsets.only(right: 8), child: Icon(Icons.store)),
            child: const Text('Tienda'),
            onPressed: () {
              context.push('/home/store');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ShadCard(
            width: 350,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cuenta Login', style: theme.textTheme.h4),
                if (user == null)
                  ShadButton.outline(
                    backgroundColor: Colors.green,
                    child: const Text('Login'),
                    onPressed: () => context.push('/login'),
                  )
                else
                  ShadButton.outline(
                    backgroundColor: Colors.red,
                    child: const Text('Logout'),
                    onPressed: () async {
                      await Database().logoutUser();
                      authController.usuarioLogin.refresh();
                    },
                  )
              ],
            ),
            description: const Text('Asegúrate de haber iniciado sesión con tu cuenta'),
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (user != null)
                  ShadButton(
                    child: const Text('Cambiar Contraseña'),
                    onPressed: () {
                      showShadSheet(
                        side: ShadSheetSide.right,
                        context: context,
                        builder: (context) => const UserClaveSheet(),
                      );
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
                  Text('Nombre', style: theme.textTheme.large),
                  Text(auth.value?.user.value?.nombre ?? ''),
                  const SizedBox(height: 6),
                  Text('Rol', style: theme.textTheme.large),
                  Text(auth.value?.user.value?.perfil ?? ''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

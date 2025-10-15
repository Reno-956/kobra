import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:due_kasir/enum/estado_enum.dart';
import 'package:due_kasir/routes/router.dart';
import 'package:due_kasir/service/database.dart';
import 'package:due_kasir/service/get_it.dart';
import 'package:due_kasir/utils/env.dart';
import 'package:due_kasir/utils/password_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'controller/selling/venta_sincro.dart';
import 'enum/perfil_enum.dart';
import 'model/clave_usuario_model.dart';
import 'model/usuario_model.dart';

final isDeviceConnected = signal(false);

Future<void> creaSuperAdmin() async {
  final usuarios = await Database().obtenerUsers();

  if (usuarios.isEmpty) {
    final admin = UsuarioModel(
      id: DateTime.now().microsecondsSinceEpoch,
      nombre: 'Super Admin',
      identificacion: 'admin123',
      telefono: '0000000000',
      correo: 'admin@local.com',
      perfil: TipoPerfil.superAdmin.message,
      fechaCreacion: DateTime.now(),
      esSincronizado: true
    );
    Database().agregarUser(admin);
    final salt = generateSaltBase64();
    final hash = hashPasswordBase64(admin.identificacion, saltBase64: salt);

    final clave = ClaveUsuarioModel()
      ..user.value = admin
      ..salt = salt
      ..claveHash = hash
      ..fechaCreacion = DateTime.now();

    Database().agregarClaveUsuario(clave);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Intl.defaultLocale = 'es_ES';
  await creaSuperAdmin();
  runApp(const MyApp());
}

final _router = GoRouter(routes: $appRoutes);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<List<ConnectivityResult>> subscription;

  @override
  void initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {

      final conectado = await InternetConnectionChecker().hasConnection;
      isDeviceConnected.value = conectado;
      log("Internet status ====== $isDeviceConnected");
      if (conectado) {
        final ventasPendientes = await Database().obtenerVentasNoSincronizadas();

        for (final venta in ventasPendientes) {
          await VentaSincro.procesarVenta(venta);
        }
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadApp.materialRouter(
      debugShowCheckedModeBanner: false,
      title: 'Kobra',
      routerConfig: _router,
      locale: const Locale('es'),
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

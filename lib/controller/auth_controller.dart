import 'package:due_kasir/service/database.dart';
import 'package:signals/signals_flutter.dart';

class AuthController {
  final usuarioLogin = futureSignal(() async => Database().authUser());
}

final authController = AuthController();

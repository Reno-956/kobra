import 'package:due_kasir/model/usuario_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:signals/signals_flutter.dart';

class UsuarioController {
  final searchUser = signal<String?>(null);
  final usuarios = futureSignal(() async =>
      Database().obtenerUsersPorCampo(value: usuarioController.searchUser.value));
  final usuarioSelected = signal<UsuarioModel?>(null);
}

final usuarioController = UsuarioController();

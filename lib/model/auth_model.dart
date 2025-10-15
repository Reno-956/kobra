import 'package:due_kasir/model/usuario_model.dart';
import 'package:isar/isar.dart';

part 'auth_model.g.dart';

@collection
class AuthModel {
  Id id = Isar.autoIncrement;
  IsarLink<UsuarioModel> user = IsarLink<UsuarioModel>();
  DateTime createdAt = DateTime.now();
}

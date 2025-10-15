import 'dart:convert';
import 'package:isar/isar.dart';
import 'usuario_model.dart';

part 'clave_usuario_model.g.dart';

@collection
class ClaveUsuarioModel {
  Id id = Isar.autoIncrement;

  final user = IsarLink<UsuarioModel>();

  String claveHash = '';
  String salt = '';

  DateTime fechaCreacion = DateTime.now();
}

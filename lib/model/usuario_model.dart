import 'package:isar/isar.dart';

part 'usuario_model.g.dart';

@collection
class UsuarioModel {
  Id? id = Isar.autoIncrement;
  late String nombre;
  String identificacion;
  String? correo;
  String? telefono;
  String perfil;
  DateTime fechaCreacion = DateTime.now();
  late bool? esSincronizado;

  UsuarioModel({
    this.id,
    required this.nombre,
    required this.identificacion,
    this.correo,
    this.telefono,
    required this.perfil,
    required this.fechaCreacion,
    this.esSincronizado,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nombre': nombre,
      'identificacion': identificacion,
      'correo': correo,
      'telefono': telefono,
      'perfil': perfil,
      'fechaCreacion': fechaCreacion.toIso8601String(),
    };
  }

  factory UsuarioModel.fromJson(json) {
    return UsuarioModel(
      id: json['id'],
      nombre: json['nombre'],
      identificacion: json['identificacion'],
      correo: json['correo'] != null ? json['correo'] as String : null,
      telefono: json['telefono'] != null ? json['telefono'] as String : null,
      perfil: json['perfil'],
      fechaCreacion: DateTime.parse(json['fechaCreacion']),
    );
  }
}

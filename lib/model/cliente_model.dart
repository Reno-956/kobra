// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'cliente_model.g.dart';

@collection
class ClienteModel {
  Id? id = Isar.autoIncrement;
  late String nombre;
  String? telefono;
  String identificacion;
  String? direccion;
  DateTime? fechaCreacion;
  bool esSincronizado;
  String? correo;

  ClienteModel({
    this.id,
    required this.nombre,
    this.telefono,
    required this.identificacion,
    this.direccion,
    this.fechaCreacion,
    this.esSincronizado = true,
    this.correo,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nombre': nombre,
      'telefono': telefono,
      'identificacion': identificacion,
      'direccion': direccion,
      'fechaCreacion': fechaCreacion?.toIso8601String(),
      'correo': correo,
    };
  }

  factory ClienteModel.fromJson(json) {
    return ClienteModel(
      id: json['id'],
      nombre: json['nombre'],
      telefono: json['telefono'] != null ? json['telefono'] as String : null,
      identificacion: json['identificacion'],
      direccion: json['direccion'] != null ? json['direccion'] as String : null,
      fechaCreacion: json['fechaCreacion'] != null ? DateTime.parse(json['fechaCreacion']) : null,
      correo: json['email'] != null ? json['email'] as String : null,
    );
  }
}

import 'package:isar/isar.dart';

part 'tienda_model.g.dart';

@collection
class TiendaModel {
  Id? id = Isar.autoIncrement;
  late String razonSocial;
  late String direccion;
  late String telefono;
  late String identificacion;
  late String correo;

  TiendaModel({
    this.id,
    required this.razonSocial,
    required this.direccion,
    required this.telefono,
    required this.identificacion,
    required this.correo,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'razonSocial': razonSocial,
      'direccion': direccion,
      'telefono': telefono,
      'identificacion': identificacion,
      'correo': correo,
    };
  }

  factory TiendaModel.fromJson(json) {
    return TiendaModel(
      id: json['id'],
      razonSocial: json['razonSocial'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      identificacion: json['identificacion'],
      correo: json['correo'],
    );
  }
}

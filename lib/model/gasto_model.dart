import 'package:isar/isar.dart';

part 'gasto_model.g.dart';

@collection
class GastoModel {
  Id? id = Isar.autoIncrement;
  String titulo;
  String? nota;
  int cantidad;
  DateTime? hechoEn;
  bool esSincronizado;

  GastoModel({
    this.id,
    required this.titulo,
    this.nota,
    required this.cantidad,
    this.hechoEn,
    this.esSincronizado = true,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'nota': nota,
      'cantidad': cantidad,
      'hechoEn': hechoEn?.toIso8601String()
    };
  }

  factory GastoModel.fromJson(json) {
    return GastoModel(
      id: json['id'],
      titulo: json['titulo'],
      nota: json['nota'] != null ? json['nota'] as String : null,
      cantidad: json['cantidad'],
      hechoEn: json['hechoEn'] != null ? DateTime.parse(json['hechoEn']) : null,
    );
  }
}

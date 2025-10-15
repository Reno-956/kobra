// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'metodo_pago_model.g.dart';

@collection
class MetodoPagoModel {
  Id? id = Isar.autoIncrement;
  late String nombre;
  String? factura;
  String? itemNombre;
  int itemCantidad;
  int cantidad;
  String estado;
  String? nota;
  DateTime fechaIngreso;
  DateTime fechaVencimiento;
  DateTime? fechaCreacion;
  bool esSincronizado;

  MetodoPagoModel({
    this.id,
    required this.nombre,
    this.factura,
    this.itemNombre,
    required this.itemCantidad,
    required this.cantidad,
    required this.estado,
    this.nota,
    required this.fechaIngreso,
    required this.fechaVencimiento,
    this.fechaCreacion,
    this.esSincronizado = true,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nombre': nombre,
      'factura': factura,
      'itemNombre': itemNombre,
      'itemCantidad': itemCantidad,
      'cantidad': cantidad,
      'estado': estado,
      'nota': nota,
      'fechaIngreso': fechaIngreso.toIso8601String(),
      'fechaVencimiento': fechaVencimiento.toIso8601String(),
      'fechaCreacion': fechaCreacion?.toIso8601String(),
    };
  }

  factory MetodoPagoModel.fromJson(json) {
    return MetodoPagoModel(
      id: json['id'],
      nombre: json['nombre'],
      factura: json['factura'] != null ? json['factura'] as String : null,
      itemNombre:
          json['itemNombre'] != null ? json['itemNombre'] as String : null,
      itemCantidad: json['itemCantidad'],
      cantidad: json['cantidad'],
      estado: json['estado'],
      nota: json['nota'],
      fechaIngreso: DateTime.parse(json['fechaIngreso']),
      fechaVencimiento: DateTime.parse(json['fechaVencimiento']),
      fechaCreacion: json['fechaCreacion'] != null ? DateTime.parse(json['fechaCreacion']) : null,
    );
  }
}

import 'package:isar/isar.dart';

part 'producto_model.g.dart';

@collection
class ProductoModel {
  Id? id = Isar.autoIncrement;
  String descripcion;
  String codigoPrincipal;
  int cantidadProducto;
  String? medida;
  double precioUnitario;
  DateTime? fechaCreacion;
  bool esSincronizado;
  int cantidad;

  ProductoModel({
    this.id,
    required this.descripcion,
    required this.codigoPrincipal,
    required this.cantidadProducto,
    this.medida,
    required this.precioUnitario,
    this.fechaCreacion,
    this.esSincronizado = true,
    required this.cantidad,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'descripcion': descripcion,
      'codigoPrincipal': codigoPrincipal,
      'cantidadProducto': cantidadProducto,
      'medida': medida ?? "",
      'precioUnitario': precioUnitario,
      'fechaCreacion': fechaCreacion?.toIso8601String(),
      'cantidad': cantidad,
    };
  }

  factory ProductoModel.fromJson(json) {
    return ProductoModel(
      id: json['id'],
      descripcion: json['descripcion'],
      codigoPrincipal: json['codigoPrincipal'],
      cantidadProducto: json['cantidadProducto'],
      medida: json['medida'] != null ? json['medida'] as String : null,
      precioUnitario: json['precioUnitario'].toDouble(),
      fechaCreacion: json['fechaCreacion'] != null ? DateTime.parse(json['fechaCreacion']) : null,
      cantidad: json['cantidad'],
    );
  }
}

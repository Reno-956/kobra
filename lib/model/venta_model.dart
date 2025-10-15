import 'dart:convert';

import 'package:isar/isar.dart';

part 'venta_model.g.dart';

@collection
class VentaModel {
  Id? id = Isar.autoIncrement;
  List<ProductItemModel> items = [];
  late int productoTotal;
  late double precioTotal;
  late double descuento;
  late int usuario;
  int? cliente;
  String? informacion;
  DateTime fechaCreacion = DateTime.now();
  bool? esSincronizado;
  String? consumidorFinal;

  VentaModel({
    this.id,
    required this.items,
    required this.productoTotal,
    required this.precioTotal,
    required this.descuento,
    required this.usuario,
    this.cliente,
    this.informacion,
    required this.fechaCreacion,
    this.esSincronizado,
    this.consumidorFinal,
  });

  factory VentaModel.fromJson(json) {
    return VentaModel(
      id: json['id'],
      items: json['items'],
      productoTotal: json['productoTotal'],
      precioTotal: json['precioTotal'],
      descuento: json['descuento'],
      usuario: json['usuario'],
      cliente: json['cliente'],
      informacion: json['informacion'],
      fechaCreacion: DateTime.parse(json['fechaCreacion']),
      consumidorFinal: json['consumidorFinal'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'items': jsonEncode(items.map((e) => e.toJson()).toList()),
      'productoTotal': productoTotal,
      'precioTotal': precioTotal,
      'descuento': descuento,
      'usuario': usuario,
      'cliente': cliente,
      'informacion': informacion,
      'fechaCreacion': fechaCreacion.toIso8601String(),
      'consumidorFinal': consumidorFinal,
    };
  }
}

@embedded
class ProductItemModel {
  late int? id;
  late String? descripcion;
  late String? codigoPrincipal;
  late int? cantidadProducto;
  late String? medida;
  double? precioUnitario;
  DateTime? fechaCreacion;
  late bool? esSincronizado;
  late int? cantidad;

  ProductItemModel({
    this.id,
    this.descripcion,
    this.codigoPrincipal,
    this.cantidadProducto,
    this.medida,
    this.precioUnitario,
    this.fechaCreacion,
    this.esSincronizado,
    this.cantidad,
  });

  factory ProductItemModel.fromJson(json) {
    return ProductItemModel(
        id: json['id'],
        descripcion: json['descripcion'],
        codigoPrincipal: json['codigoPrincipal'],
        cantidadProducto: json['cantidadProducto'],
        medida: json['medida'],
        precioUnitario: json['precioUnitario'],
        fechaCreacion: json['fechaCreacion'],
        esSincronizado: json['esSincronizado'],
        cantidad: json['cantidad']);
  }

  toJson() {
    return <String, dynamic>{
      'id': id,
      'descripcion': descripcion,
      'codigoPrincipal': codigoPrincipal,
      'cantidadProducto': cantidadProducto,
      'medida': medida,
      'precioUnitario': precioUnitario,
      'fechaCreacion': fechaCreacion?.toIso8601String(),
      'cantidad': cantidad,
    };
  }
}

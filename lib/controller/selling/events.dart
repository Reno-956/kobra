import 'package:due_kasir/model/producto_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class CartEvent extends Equatable {
  const CartEvent();
}

final class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

final class CartItemAdded extends CartEvent {
  const CartItemAdded(this.item);

  final ProductoModel item;

  @override
  List<Object> get props => [item];
}

final class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.item);

  final ProductoModel item;

  @override
  List<Object> get props => [item];
}

final class CartPaid extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartItemCantidadActualizada extends CartEvent {
  final ProductoModel item;
  final int nuevaCantidad;

  CartItemCantidadActualizada(this.item, this.nuevaCantidad);

  @override
  List<Object?> get props => [item, nuevaCantidad];
}

class CartItemItbmsActualizado extends CartEvent {
  final ProductoModel item;
  final double? nuevoItbms;

  CartItemItbmsActualizado(this.item, this.nuevoItbms);

  @override
  List<Object?> get props => [item, nuevoItbms];
}

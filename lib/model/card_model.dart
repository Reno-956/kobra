import 'package:due_kasir/model/producto_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({this.items = const <ProductoModel>[]});

  final List<ProductoModel> items;

  int get productoTotal {
    return items.fold(0, (total, current) => total + current.cantidad);
  }

  double get precioTotal {
    return items.fold(0.0, (total, current) {
      final precio = current.precioUnitario;
      final cantidad = current.cantidad;

      final totalConItbms = precio * cantidad;
      return total + totalConItbms;
    });
  }

  @override
  List<Object> get props => [items];
}

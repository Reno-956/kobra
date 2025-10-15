import 'package:collection/collection.dart';
import 'package:due_kasir/model/producto_model.dart';

class CartService {
  final _items = <ProductoModel>[];

  Future<List<ProductoModel>> loadProducts() =>
      Future.delayed(const Duration(milliseconds: 100) * 10, () => _items);

  void add(ProductoModel item) {
    final isSame = _items
        .firstWhereOrNull((val) => val.codigoPrincipal == item.codigoPrincipal);
    if (isSame != null) {
      final data = _items.firstWhere((val) => val.id == item.id);
      data.cantidad = data.cantidad + 1;
    } else {
      _items.add(item);
    }
  }

  void update(ProductoModel item) {
    final isSame = _items
        .firstWhereOrNull((val) => val.codigoPrincipal == item.codigoPrincipal);
    if (isSame != null) {
      final data = _items.firstWhere((val) => val.id == item.id);
      data.cantidad = data.cantidad + 1;
    }
  }

  void remove(ProductoModel item) => _items.remove(item);

  void clear() => _items.clear();

  void updateCantidad(ProductoModel productoActualizado) {
    final index = _items.indexWhere(
        (val) => val.codigoPrincipal == productoActualizado.codigoPrincipal);
    if (index != -1) {
      _items[index] = productoActualizado;
    }
  }

  void updateItbms(ProductoModel productoActualizado) {
    final index = _items.indexWhere(
        (val) => val.codigoPrincipal == productoActualizado.codigoPrincipal);
    if (index != -1) {
      _items[index] = productoActualizado;
    }
  }
}

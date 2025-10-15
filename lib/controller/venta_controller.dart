import 'package:collection/collection.dart';
import 'package:due_kasir/controller/producto_controller.dart';
import 'package:due_kasir/controller/selling/events.dart';
import 'package:due_kasir/controller/selling/service.dart';
import 'package:due_kasir/enum/payment_enum.dart';
import 'package:due_kasir/model/card_model.dart';
import 'package:due_kasir/model/cliente_model.dart';
import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/model/usuario_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class SellingController {
  SellingController(this._cartService);

  final CartService _cartService;
  final isSearch = Signal(false);
  final tipoPago = Signal(TypePayment.cash);
  final cliente = Signal<ClienteModel?>(null);
  final usuario = Signal<UsuarioModel?>(null);
  final consumidorFinal = Signal<String?>(null);
  final impresora = Signal<String>("Xprinter XP-T371U");

  late final _carro = signal<AsyncState<Cart>>(const AsyncLoading());

  ReadonlySignal<AsyncState<Cart>> get carro => _carro;

  Future<void> dispatch(CartEvent event) async {
    switch (event) {
      case CartStarted():
        _carro.value = const AsyncLoading();
        _cartService
            .loadProducts()
            .then((items) => _carro.value = AsyncData(Cart(items: [...items])))
            // ignore: invalid_return_type_for_catch_error
            .catchError((e, s) => _carro.set(AsyncError(e, s)));

      case CartItemAdded(:final item):
        if (_carro.value case AsyncData<Cart>(:final value)) {
          try {
            final isSame = _carro.value.value?.items.firstWhereOrNull(
                (val) => val.codigoPrincipal == item.codigoPrincipal);
            _cartService.add(item);
            if (isSame != null) {
              _carro.value = AsyncData(Cart(items: [...value.items, item]));
              _carro.value = AsyncData(
                Cart(
                  items: [...value.items]..remove(event.item),
                ),
              );
            } else {
              _carro.value = AsyncData(Cart(items: [...value.items, item]));
            }
          } catch (e, s) {
            _carro.value = AsyncError(e, s);
          }
        }

      case CartItemRemoved(:final item):
        if (_carro.value case AsyncData<Cart>(:final value)) {
          try {
            _cartService.remove(item);
            _carro.value = AsyncData(
              Cart(
                items: [...value.items]..remove(event.item),
              ),
            );
          } catch (e, s) {
            _carro.value = AsyncError(e, s);
          }
        }

      case CartPaid():
        _carro.value = const AsyncLoading();
        _cartService.clear();
        _carro.value = const AsyncData(Cart());
        consumidorFinal.value = null;

      case CartItemCantidadActualizada(:final item, :final nuevaCantidad):
        if (_carro.value case AsyncData<Cart>(:final value)) {
          try {
            final index = value.items.indexWhere(
                (val) => val.codigoPrincipal == item.codigoPrincipal);
            if (index != -1) {
              final original = value.items[index];

              // Clonar el producto original con la nueva cantidad
              final updatedItem = ProductoModel.fromJson(original.toJson())
                ..cantidad = nuevaCantidad;

              final updatedList = [...value.items];
              updatedList[index] = updatedItem;

              _cartService.updateCantidad(updatedItem);
              _carro.value = AsyncData(Cart(items: updatedList));
            }
          } catch (e, s) {
            _carro.value = AsyncError(e, s);
          }
        }

      case CartItemItbmsActualizado(:final item, :final nuevoItbms):
        if (_carro.value case AsyncData<Cart>(:final value)) {
          try {
            final index = value.items.indexWhere(
                (val) => val.codigoPrincipal == item.codigoPrincipal);

            if (index != -1) {
              final original = value.items[index];

              final updatedList = [...value.items];
              updatedList[index] = original;
              //_cartService.updateItbms(original);
              _carro.value = AsyncData(Cart(items: updatedList));
            }
          } catch (e, s) {
            _carro.value = AsyncError(e, s);
          }
        }
    }
  }

  Future<void> updateBatch(List<ProductoModel> items) async {
    await Future.forEach<ProductoModel>(items, (i) async {
      final item = i
        ..cantidadProducto = i.cantidadProducto - i.cantidad
        ..cantidad = 1;
      await Database().actualizarProducto(item);
    });
    Future.delayed(Durations.short1).then((_) {
      productoController.productos.refresh();
    });
  }
}

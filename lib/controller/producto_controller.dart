import 'dart:io';

import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:signals/signals_flutter.dart';

class InventoryController {
  final searchInventory = signal<String?>(null);
  final productos = futureSignal(() async =>
      Database()
          .obtenerProductos(value: productoController.searchInventory.value));
  final deleteItemList = Signal<List<ProductoModel>>([]);
  final productoSelected = signal<ProductoModel?>(null);
  final csvFile = signal<File?>(null);
  final selectAll = signal<bool>(false);
  final listItemFromCsv = ListSignal<ProductoModel>([]);
}

final productoController = InventoryController();

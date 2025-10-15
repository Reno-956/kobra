import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:due_kasir/controller/producto_controller.dart';
import 'package:due_kasir/controller/venta_controller.dart';
import 'package:due_kasir/enum/estado_enum.dart';
import 'package:due_kasir/main.dart';
import 'package:due_kasir/model/auth_model.dart';
import 'package:due_kasir/model/cliente_model.dart';
import 'package:due_kasir/model/gasto_model.dart';
import 'package:due_kasir/model/metodo_pago_model.dart';
import 'package:due_kasir/model/presence_model.dart';
import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/model/rent_item_model.dart';
import 'package:due_kasir/model/rent_model.dart';
import 'package:due_kasir/model/salary_model.dart';
import 'package:due_kasir/model/tienda_model.dart';
import 'package:due_kasir/model/usuario_model.dart';
import 'package:due_kasir/model/venta_model.dart';
import 'package:due_kasir/service/get_it.dart';
import 'package:due_kasir/service/supabase_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/clave_usuario_model.dart';
import '../utils/password_utils.dart';

class Database {
  late Future<Isar> db;

  Database() {
    db = openDB();
  }

  // Auth Local
  Future<void> loginUser(AuthModel val) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.authModels.putSync(val));
  }

  Future<void> cambiarUser(AuthModel val) async {
    final isar = await db;
    isar.writeTxn(() async {
      await isar.authModels.put(val);
      await val.user.save();
    });
  }

  Future<void> logoutUser() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.authModels.clear();
    });
  }

  // User
  Future<AuthModel> authUser() async {
    final isar = await db;
    IsarCollection<AuthModel> authCollection = isar.collection<AuthModel>();
    final users = await authCollection.where().findAll();
    getIt.get<SellingController>().usuario.value = users.first.user.value;
    return users.first;
  }

  Future<void> agregarUser(UsuarioModel val) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.usuarioModels.putSync(val));
  }

  Future<void> borrarUser(int val) async {
    final isar = await db;
    isar.writeTxn<bool>(() async => await isar.usuarioModels.delete(val));
  }

  Future<void> actualizarUser(UsuarioModel val) async {
    final isar = await db;
    isar.writeTxn<int>(() => isar.usuarioModels.put(val));
  }

  Future<List<UsuarioModel>> obtenerUsersPorCampo({String? value}) async {
    final isar = await db;
    IsarCollection<UsuarioModel> userCollection =
        isar.collection<UsuarioModel>();
    final users = userCollection
        .filter()
        .group((q) => q
            .nombreContains(value ?? '', caseSensitive: false)
            .or()
            .identificacionContains(value ?? '', caseSensitive: false))
        .findAll();
    return users;
  }

  Future<List<UsuarioModel>> obtenerUsers() async {
    final isar = await db;
    IsarCollection<UsuarioModel> userCollection =
    isar.collection<UsuarioModel>();
    final users = userCollection
        .where()
        .findAll();
    return users;
  }

  Future<UsuarioModel?> obtenerUserPorId(int id) async {
    final isar = await db;
    IsarCollection<UsuarioModel> userCollection =
        isar.collection<UsuarioModel>();
    final users = userCollection.get(id);
    return users;
  }

  Future<void> limpiarUser() async {
    final isar = await db;
    IsarCollection<UsuarioModel> userCollection =
        isar.collection<UsuarioModel>();
    isar.writeTxn<void>(() => userCollection.clear());
  }

  insertarUserFresh(List<UsuarioModel> userList) async {
    final isar = await db;
    await limpiarUser();
    if (userList.isNotEmpty) {
      await Future.forEach(
          userList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.usuarioModels.put(val)));
      await obtenerUsersPorCampo();
    }
  }

  Future<void> syncUsers() async {
    final users = await obtenerUsersPorCampo();
    /*if (users.isNotEmpty) {
      await Future.forEach(users, (element) async {
        final res = await _supabaseHelper.getUserById(element.id!);
        if (res == false) {
          _supabaseHelper.addUsers(element.toJson());
        }
      });
      final res = await _supabaseHelper.getUsers();
      if (res.isNotEmpty) {
        await insertUserFresh(res);
      }
    } else {
      final res = await _supabaseHelper.getUsers();
      if (res.isNotEmpty) {
        await insertUserFresh(res);
      }
    }*/
  }

  Future<UsuarioModel?> obtenerUserPorEmailYIde(String email) async {
    final isar = await db;
    IsarCollection<UsuarioModel> userCollection =
    isar.collection<UsuarioModel>();
    final users = userCollection
        .filter()
        .correoEqualTo(email)
        .findFirst();
    return users;
  }

  //ClaveUser
  Future<int> agregarClaveUsuario(ClaveUsuarioModel clave) async {
    final isar = await db;
    return await isar.writeTxn<int>(() async {
      final id = await isar.claveUsuarioModels.put(clave);
      await clave.user.save();
      return id;
    });
  }

  Future<ClaveUsuarioModel?> obtenerClaveUsuarioPorUserId(int userId) async {
    final isar = await db;
    return await isar.claveUsuarioModels.filter()
        .user((q) => q.idEqualTo(userId))
        .findFirst();
  }

  Future<void> actualizarClaveUsuarioPorUserId(int userId, String newPasswordPlain) async {
    final isar = await db;
    final clave = await obtenerClaveUsuarioPorUserId(userId);
    final salt = generateSaltBase64();
    final hash = hashPasswordBase64(newPasswordPlain, saltBase64: salt);
    if (clave != null) {
      clave.salt = salt;
      clave.claveHash = hash;
      await isar.writeTxn(() async {
        await isar.claveUsuarioModels.put(clave);
      });
    } else {
      final user = await isar.usuarioModels.get(userId);
      if (user != null) {
        final newClave = ClaveUsuarioModel()
          ..user.value = user
          ..salt = salt
          ..claveHash = hash
          ..fechaCreacion = DateTime.now();
        await isar.writeTxn(() async {
          await isar.claveUsuarioModels.put(newClave);
          await newClave.user.save();
        });
      }
    }
  }

  Future<bool> validarClaveUsuario(String emailOrCorreo, String passwordPlain) async {
    final isar = await db;

    final usuario = await isar.usuarioModels.filter().correoEqualTo(emailOrCorreo).findFirst();
    if (usuario == null) return false;

    final clave = await obtenerClaveUsuarioPorUserId(usuario.id!);
    if (clave == null) return false;

    return verifyPassword(passwordPlain, clave.salt, clave.claveHash);
  }

  // Customer
  Future<void> agregarCliente(ClienteModel val) async {
    val.esSincronizado =
        isDeviceConnected.value;
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.clienteModels.putSync(val));
  }

  Future<void> borrarCliente(int val) async {
    final isar = await db;
    isar.writeTxn<bool>(() async => await isar.clienteModels.delete(val));
  }

  Future<void> actualizarCliente(ClienteModel val) async {
    final isar = await db;
    isar.writeTxn<int>(() async => await isar.clienteModels.put(val));
  }

  Future<List<ClienteModel>> obtenerClientesPorCampo({String? value}) async {
    final isar = await db;
    IsarCollection<ClienteModel> customerCollection =
        isar.collection<ClienteModel>();
    final customer = customerCollection
        .filter()
        .group((q) => q
            .nombreContains(value ?? '', caseSensitive: false)
            .or()
            .identificacionContains(value ?? '', caseSensitive: false))
        .findAll();
    return customer;
  }

  Future<List<ClienteModel>> obtenerClientes() async {
    final isar = await db;
    IsarCollection<ClienteModel> customerCollection =
        isar.collection<ClienteModel>();
    final customer = customerCollection.where().findAll();
    return customer;
  }

  Future<List<VentaModel>> obtenerVentas() async {
    final isar = await db;
    IsarCollection<VentaModel> customerCollection =
        isar.collection<VentaModel>();
    final customer = customerCollection.where().findAll();
    return customer;
  }

  Future<List<VentaModel>> obtenerReportes(
      {required DateTime start, required DateTime end}) async {
    final isar = await db;
    IsarCollection<VentaModel> reportCollection = isar.collection<VentaModel>();
    final customer = reportCollection
        .where()
        .filter()
        .fechaCreacionBetween(start.copyWith(hour: 0, minute: 0, second: 0),
            end.copyWith(hour: 23, minute: 59, second: 59))
        .findAll();
    return customer;
  }

  Future<void> syncCustomers() async {
    final customers = await obtenerClientesPorCampo();
    /*if (customers.isNotEmpty) {
      await Future.forEach(customers, (val) async {
        final res = await _supabaseHelper.getCustomerById(val.id!);
        if (res == false) {
          await _supabaseHelper.addCustomer(val.toJson());
        }
      });
      final res = await _supabaseHelper.getCustomerAll();
      if (res.isNotEmpty) {
        await insertCustomerFresh(res);
      }
    } else {
      final res = await _supabaseHelper.getCustomerAll();
      if (res.isNotEmpty) {
        await insertCustomerFresh(res);
      }
    }*/
  }

  Future<void> limpiarCliente() async {
    final isar = await db;
    IsarCollection<ClienteModel> customerCollection =
        isar.collection<ClienteModel>();
    isar.writeTxn<void>(() => customerCollection.clear());
  }

  insertarClienteFresh(List<ClienteModel> customerList) async {
    final isar = await db;
    await limpiarCliente();
    if (customerList.isNotEmpty) {
      await Future.forEach(
          customerList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.clienteModels.put(val)));
    }
    await obtenerClientesPorCampo();
  }

  Future<void> checkCustomerSynced() async {
    final customers = await obtenerClientesPorCampo();
    if (customers.isNotEmpty) {
      /*for (ClienteModel element in customers) {
        final res = await _supabaseHelper.getCustomerById(element.id!);
        if (res == false) {
          _supabaseHelper.addCustomer(element.toJson());
        }
      }*/
    } else {
      obtenerClientesPorCampo();
    }
  }

  Future<ClienteModel?> obtenerClientePorId(int id) async {
    final isar = await db;
    IsarCollection<ClienteModel> customerCollection =
        isar.collection<ClienteModel>();
    final users = customerCollection.get(id);
    return users;
  }

  // inventory
  Future<void> agregarProducto(ProductoModel val) async {
    val.esSincronizado =
        isDeviceConnected.value;
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.productoModels.putSync(val));
  }

  Future<void> agregarProductosLista(List<ProductoModel> vals) async {
    final isar = await db;
    for (var val in vals) {
      val.esSincronizado =
          isDeviceConnected.value;
      isar.writeTxnSync<int>(() => isar.productoModels.putSync(val));
    }
  }

  Future<void> eliminarProducto(int val) async {
    final isar = await db;
    isar.writeTxn<bool>(() async => await isar.productoModels.delete(val));
  }

  Future<void> actualizarProducto(ProductoModel val) async {
    final isar = await db;
    isar.writeTxn<int>(() async => await isar.productoModels.put(val));
  }

  insertarProductoFresh(List<ProductoModel> inventoryList) async {
    final isar = await db;
    await limpiarProducto();
    if (inventoryList.isNotEmpty) {
      await Future.forEach(
          inventoryList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.productoModels.put(val)));
    }
  }

  Future<List<ProductoModel>> obtenerProductosPorCampo({String? value}) async {
    final isar = await db;
    IsarCollection<ProductoModel> inventoryCollection =
        isar.collection<ProductoModel>();
    final items = inventoryCollection
        .filter()
        .group((q) => q
            .descripcionContains(value ?? '', caseSensitive: false)
            .or()
            .codigoPrincipalContains(value ?? '', caseSensitive: false))
        .findAll();
    return items;
  }

  Future<List<ProductoModel>> obtenerProductos({String? value}) async {
    final isar = await db;
    IsarCollection<ProductoModel> inventoryCollection =
    isar.collection<ProductoModel>();
    final items = inventoryCollection
        .filter()
        .group((q) => q
          .descripcionContains(value ?? '', caseSensitive: false)
          .or()
          .codigoPrincipalContains(value ?? '', caseSensitive: false))
        .findAll();
    return items;
  }

  Future<ProductoModel?> buscarPorBarcode(String value) async {
    final isar = await db;
    IsarCollection<ProductoModel> inventoryCollection =
        isar.collection<ProductoModel>();
    final items = await inventoryCollection
        .filter()
        .group((q) => q.codigoPrincipalContains(value, caseSensitive: false))
        .findFirst();
    return items;
  }

  void actualizarProductoSync(ProductoModel inventory) async {
    final isar = await db;
    inventory.esSincronizado = true;
    await isar.writeTxn(() async {
      await isar.productoModels.put(inventory);
    });
  }

  obtenerProdcutoNoSync() async {
    final isar = await db;
    IsarCollection<ProductoModel> inventoryCollection =
        isar.collection<ProductoModel>();
    List<ProductoModel?> items = await inventoryCollection
        .filter()
        .esSincronizadoEqualTo(false)
        .findAll();
    return items;
  }

  Future<void> checkIsInventorySynced() async {
    final inventorys = await obtenerProductosPorCampo();
    /*if (inventorys.isNotEmpty) {
      List<ProductoModel> unsyncedInventory = await getUnsyncedInventoryData();
      if (productoController.deleteItemList.value.isNotEmpty) {
        await Future.forEach(productoController.deleteItemList.value,
            (element) async => _supabaseHelper.removeInventory(element.id!));
        for (ItemModel element in inventoryController.deleteItemList.value) {
           _supabaseHelper.removeInventory(element.id!);
        }
        productoController.deleteItemList.value.clear();
      }
      if (unsyncedInventory.isNotEmpty) {
        await Future.forEach(unsyncedInventory, (element) async {
          element.esSincronizado = true;
          await _supabaseHelper.updateInventory(element);
          updateInventorySync(element);
        });
      }
      // refresh
      final res = await _supabaseHelper.getInventoryAll();
      await insertInventoryFresh(res);
    } else {
      final res = await _supabaseHelper.getInventoryAll();
      await insertInventoryFresh(res);
      getInventorys();
    }*/
  }

  Future<void> limpiarProducto() async {
    final isar = await db;
    IsarCollection<ProductoModel> inventoryCollection =
        isar.collection<ProductoModel>();
    isar.writeTxn<void>(() => inventoryCollection.clear());
  }

  Future<List<ProductoModel>> obtenerProdcutoSinStock() async {
    final isar = await db;
    IsarCollection<ProductoModel> inventoryCollection =
        isar.collection<ProductoModel>();
    final items = inventoryCollection
        .filter()
        .group((q) => q.cantidadProductoLessThan(1))
        .findAll();
    return items;
  }

  // sales
  Future<void> agregarVenta(VentaModel val) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.ventaModels.putSync(val));
  }

  Future<void> syncItemPenjualan(VentaModel val) async {
    /*if (isDeviceConnected.value && supabase.auth.currentUser != null) {
      _supabaseHelper.addReport(val.toJson());
    }*/
  }

  Future<void> eliminarVenta(int val) async {
    final isar = await db;
    isar.writeTxn<bool>(() => isar.ventaModels.delete(val));
  }

  Future<void> actualizarVenta(VentaModel val) async {
    final isar = await db;
    isar.writeTxn<int>(() async => await isar.ventaModels.put(val));
  }

  Future<List<VentaModel>> obtenerVentasNoSincronizadas() async {
    final isar = await db;

    IsarCollection<VentaModel> ventaCollection =
    isar.collection<VentaModel>();
    final ventas = ventaCollection
        .filter()
        .esSincronizadoEqualTo(false)
        .findAll();
    return ventas;
  }

  Future<void> limpiarVenta() async {
    final isar = await db;
    IsarCollection<VentaModel> reportCollection = isar.collection<VentaModel>();
    isar.writeTxn<void>(() => reportCollection.clear());
  }

  insertarVentaFresh(List<VentaModel> reportList) async {
    final isar = await db;
    await limpiarVenta();

    if (reportList.isNotEmpty) {
      await Future.forEach(
          reportList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.ventaModels.put(val)));
    }
  }

  Future<List<VentaModel>> obtenerReporte(
      {required DateTime start, required DateTime end}) async {
    final isar = await db;
    IsarCollection<VentaModel> reportCollection = isar.collection<VentaModel>();
    /*if (isDeviceConnected.value && supabase.auth.currentUser == null) {
      final List<VentaModel> res = await _supabaseHelper.getRepots(
        start: start.copyWith(hour: 0, minute: 0, second: 0),
        end: end.copyWith(hour: 23, minute: 59, second: 59),
      );*/
      final items = await reportCollection
          .where()
          .filter()
          .fechaCreacionBetween(start.copyWith(hour: 0, minute: 0, second: 0),
              end.copyWith(hour: 23, minute: 59, second: 59))
          .findAll();
      /*if (res.length == items.length || items.length >= res.length) {
        return items;
      } else {
        await insertReportFresh(res);
        final freshItems = await reportCollection
            .where()
            .filter()
            .fechaCreacionBetween(start.copyWith(hour: 0, minute: 0, second: 0),
                end.copyWith(hour: 23, minute: 59, second: 59))
            .findAll();
        return freshItems;
      }
    }*/
    return items;
  }

  Future<List<VentaModel>> obtenerReportePorId({
    required DateTime start,
    required DateTime end,
    int? userId,
  }) async {
    final isar = await db;
    IsarCollection<VentaModel> reportCollection = isar.collection<VentaModel>();

    final items = await reportCollection
        .where()
        .filter()
        .fechaCreacionBetween(
          start.copyWith(hour: 0, minute: 0, second: 0),
          end.copyWith(hour: 23, minute: 59, second: 59),
        )
        .usuarioEqualTo(userId ?? 0)
        .findAll();

    return items;
  }

  Future<List<VentaModel>> obtenerReporteHoy() async {
    final isar = await db;
    IsarCollection<VentaModel> inventoryCollection =
        isar.collection<VentaModel>();
    final items = await inventoryCollection
        .filter()
        .fechaCreacionBetween(
            DateTime.now().copyWith(hour: 0, minute: 0, second: 0),
            DateTime.now().copyWith(hour: 23, minute: 59, second: 59))
        .findAll();
    return items;
  }

  Future<List<VentaModel>> obtenerReporteAyer() async {
    final isar = await db;
    IsarCollection<VentaModel> inventoryCollection =
        isar.collection<VentaModel>();
    final items = await inventoryCollection
        .filter()
        .fechaCreacionBetween(
            DateTime.now()
                .subtract(const Duration(days: 1))
                .copyWith(hour: 0, minute: 0, second: 0),
            DateTime.now()
                .subtract(const Duration(days: 1))
                .copyWith(hour: 23, minute: 59, second: 59))
        .findAll();
    return items;
  }

  Future<Map<int, List<VentaModel>>> obtenerVentasPorUser() async {
    final isar = await db;
    IsarCollection<VentaModel> inventoryCollection =
        isar.collection<VentaModel>();
    final items = await inventoryCollection.where().findAll();

    final Map<int, List<VentaModel>> listOfOrders =
        items.groupListsBy((i) => i.usuario);

    return listOfOrders;
  }

  Future<Map<DateTime, List<VentaModel>>> obtenerVentasPorFecha(
      {required DateTime start, required DateTime end}) async {
    final isar = await db;
    IsarCollection<VentaModel> inventoryCollection =
        isar.collection<VentaModel>();
    List<VentaModel> items = inventoryCollection
        .where()
        .filter()
        .fechaCreacionBetween(start.copyWith(hour: 0, minute: 0, second: 0),
            end.copyWith(hour: 23, minute: 59, second: 59))
        .findAllSync();

    final Map<DateTime, List<VentaModel>> listOfOrders = items.groupListsBy(
        (order) => DateTime(order.fechaCreacion.year, order.fechaCreacion.month,
            order.fechaCreacion.day));

    return listOfOrders;
  }

  Future<List<VentaModel>> getReportAll() async {
    final isar = await db;
    IsarCollection<VentaModel> reportCollection = isar.collection<VentaModel>();
    /*if (isDeviceConnected.value && supabase.auth.currentUser != null) {
      final List<VentaModel> res = await _supabaseHelper.getRepots();*/
      final items = await reportCollection.where().findAll();
      /*if (res.length == items.length) {
        return items;
      } else {
        await insertReportFresh(res);
        final freshItems = await reportCollection.where().findAll();
        return freshItems;
      }
    }*/
    return items;
  }

  Future<void> checkIsReportSynced() async {
    final reports = await getReportAll();
    if (reports.isNotEmpty) {
      /*for (VentaModel element in reports) {
        final res = await _supabaseHelper.getReportById(element.id!);
        if (res == false) {
          _supabaseHelper.addReport(element.toJson());
        }
      }*/
    } else {
      getReportAll();
    }
  }

  Future<void> agregarTienda(TiendaModel val) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.tiendaModels.putSync(val));
  }

  Future<TiendaModel?> obtenerTienda() async {
    final isar = await db;
    IsarCollection<TiendaModel> storeCollection =
        isar.collection<TiendaModel>();
    final store = storeCollection.where().findFirst();
    return store;
  }

  Future<void> syncTienda() async {
    final store = await obtenerTienda();
    /*if (store != null) {
      _supabaseHelper.updateStore(store);
    } else {
      final res = await _supabaseHelper.getStore();
      if (res != null) {
        await addStore(res);
      }
    }*/
  }

  // presense
  Future<void> addPresense(PresenceModel val) async {
    val.isSynced = isDeviceConnected.value;
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.presenceModels.putSync(val));
  }

  Future<List<PresenceModel>> getPresense(
      {required DateTime start, required DateTime end}) async {
    final isar = await db;
    IsarCollection<PresenceModel> presenseCollection =
        isar.collection<PresenceModel>();
    return await presenseCollection
        .where()
        .filter()
        .createdAtBetween(start.copyWith(hour: 0, minute: 0, second: 0),
            end.copyWith(hour: 23, minute: 59, second: 59))
        .findAll();
  }

  // sync presense
  Future<void> presenseSync() async {
    final isar = await db;
    IsarCollection<PresenceModel> presenseCollection =
        isar.collection<PresenceModel>();

    final presense = await presenseCollection.where().findAll();
    /*if (presense.isNotEmpty) {
      final res = await _supabaseHelper.getPresense();
      if (res.length != presense.length) {
        if (presense.length >= res.length) {
          await Future.forEach(presense, (val) async {
            final res = await _supabaseHelper.getPresenseById(val.id!);
            if (res == false) {
              _supabaseHelper.addPresense(val.toJson());
            }
          });
          final res = await _supabaseHelper.getPresense();
          await insertPresenseFresh(res);
        } else {
          await insertPresenseFresh(res);
        }
      }
    } else {
      final res = await _supabaseHelper.getPresense();
      await insertPresenseFresh(res);
    }*/
  }

  Future<void> clearPresense() async {
    final isar = await db;
    IsarCollection<PresenceModel> presenseCollection =
        isar.collection<PresenceModel>();
    isar.writeTxn<void>(() => presenseCollection.clear());
  }

  insertPresenseFresh(List<PresenceModel> presenseList) async {
    final isar = await db;
    await clearPresense();

    if (presenseList.isNotEmpty) {
      await Future.forEach(
          presenseList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.presenceModels.put(val)));
    }
  }

  // rent item
  Future<void> addRentItem(RentItemModel val) async {
    val.isSynced = isDeviceConnected.value;
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.rentItemModels.putSync(val));
  }

  Future<List<RentItemModel>> getRentItem() async {
    final isar = await db;
    IsarCollection<RentItemModel> rentItemCollection =
        isar.collection<RentItemModel>();

    return await rentItemCollection.where().findAll();
  }

  Future<RentItemModel?> getRentItemById(int id) async {
    final isar = await db;
    IsarCollection<RentItemModel> rentItemCollection =
        isar.collection<RentItemModel>();
    final rent = rentItemCollection.get(id);
    return rent;
  }

  Future<void> deleteRentItem(int val) async {
    final isar = await db;
    isar.writeTxn<bool>(() async => await isar.rentItemModels.delete(val));
  }

  Future<void> updateRentItem(RentItemModel val) async {
    final isar = await db;
    isar.writeTxn<int>(() async => await isar.rentItemModels.put(val));
  }

  // sync rent items
  Future<void> rentItemSync() async {
    final rentItems = await getRentItem();
    /*if (rentItems.isNotEmpty) {
      final res = await _supabaseHelper.getRentItems();
      if (res.length != rentItems.length) {
        if (rentItems.length >= res.length) {
          await Future.forEach(rentItems, (val) async {
            final res = await _supabaseHelper.getRentItemById(val.id!);
            if (res == false) {
              _supabaseHelper.addRentItem(val.toJson());
            }
          });
          final res = await _supabaseHelper.getRentItems();
          await insertRentItemsFresh(res);
        } else {
          await insertRentItemsFresh(res);
        }
      }
    } else {
      final res = await _supabaseHelper.getRentItems();
      await insertRentItemsFresh(res);
    }*/
  }

  Future<void> clearRentItems() async {
    final isar = await db;
    IsarCollection<RentItemModel> rentItemsCollection =
        isar.collection<RentItemModel>();
    isar.writeTxn<void>(() => rentItemsCollection.clear());
  }

  insertRentItemsFresh(List<RentItemModel> rentItemList) async {
    final isar = await db;
    await clearRentItems();
    if (rentItemList.isNotEmpty) {
      await Future.forEach(
          rentItemList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.rentItemModels.put(val)));
    }
  }

  // rent
  Future<void> addRent(RentModel val) async {
    val.isSynced = isDeviceConnected.value;
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.rentModels.putSync(val));
  }

  Future<List<RentModel>> getRent() async {
    final isar = await db;
    IsarCollection<RentModel> rentCollection = isar.collection<RentModel>();
    return await rentCollection.where().findAll();
  }

  Future<void> updateRent(RentModel val) async {
    final isar = await db;
    isar.writeTxn<int>(() async => await isar.rentModels.put(val));
  }

  Future<List<RentModel>> getRentRevenue() async {
    final isar = await db;
    IsarCollection<RentModel> rentCollection = isar.collection<RentModel>();

    return await rentCollection.filter().paidEqualTo(true).findAll();
  }

  // sync rent
  Future<void> rentSync() async {
    final rent = await getRent();
    /*if (rent.isNotEmpty) {
      final res = await _supabaseHelper.getRent();
      if (res.length != rent.length) {
        if (rent.length >= res.length) {
          await Future.forEach(rent, (val) async {
            final res = await _supabaseHelper.getRentById(val.id!);
            if (res == false) {
              _supabaseHelper.addRent(val.toJson());
            }
          });
          final res = await _supabaseHelper.getRent();
          await insertRentFresh(res);
        } else {
          await insertRentFresh(res);
        }
      }
    } else {
      final res = await _supabaseHelper.getRent();
      await insertRentFresh(res);
    }*/
  }

  Future<void> clearRent() async {
    final isar = await db;
    IsarCollection<RentModel> rentCollection = isar.collection<RentModel>();
    isar.writeTxn<void>(() => rentCollection.clear());
  }

  insertRentFresh(List<RentModel> rentList) async {
    final isar = await db;
    await clearRent();
    if (rentList.isNotEmpty) {
      await Future.forEach(
          rentList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.rentModels.put(val)));
    }
  }

  // expenses
  Future<void> addExpenses(GastoModel val) async {
    val.esSincronizado =
        isDeviceConnected.value ;
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.gastoModels.putSync(val));
  }

  Future<void> deleteExpenses(int val) async {
    final isar = await db;
    isar.writeTxn<bool>(() async => await isar.gastoModels.delete(val));
  }

  Future<List<GastoModel>> getExpenses(
      {required DateTime start, required DateTime end}) async {
    final isar = await db;
    IsarCollection<GastoModel> expensesCollection =
        isar.collection<GastoModel>();
    return await expensesCollection
        .where()
        .filter()
        .hechoEnBetween(start.copyWith(hour: 0, minute: 0, second: 0),
            end.copyWith(hour: 23, minute: 59, second: 59))
        .findAll();
  }

  // sync expenses
  Future<void> expensesSync() async {
    final isar = await db;
    IsarCollection<GastoModel> expensesCollection =
        isar.collection<GastoModel>();

    final expenses = await expensesCollection.where().findAll();
    /*if (expenses.isNotEmpty) {
      final res = await _supabaseHelper.getExpenses();
      if (res.length != expenses.length) {
        if (expenses.length >= res.length) {
          await Future.forEach(expenses, (val) async {
            final res = await _supabaseHelper.getRentById(val.id!);
            if (res == false) {
              _supabaseHelper.addExpenses(val.toJson());
            }
          });
          final res = await _supabaseHelper.getExpenses();
          insertExpensesFresh(res);
        } else {
          insertExpensesFresh(res);
        }
      }
    } else {
      final res = await _supabaseHelper.getExpenses();
      insertExpensesFresh(res);
    }*/
  }

  Future<void> clearExpenses() async {
    final isar = await db;
    IsarCollection<GastoModel> expensesCollection =
        isar.collection<GastoModel>();
    isar.writeTxn<void>(() => expensesCollection.clear());
  }

  insertExpensesFresh(List<GastoModel> expensesList) async {
    final isar = await db;
    await clearExpenses();

    if (expensesList.isNotEmpty) {
      await Future.forEach(
          expensesList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.gastoModels.put(val)));
    }
  }

  // Salary
  Future<void> addSalary(SalaryModel val) async {
    val.isSynced = isDeviceConnected.value;
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.salaryModels.putSync(val));
  }

  Future<List<SalaryModel>> getSalary() async {
    final isar = await db;
    IsarCollection<SalaryModel> salaryCollection =
        isar.collection<SalaryModel>();

    return await salaryCollection.where().findAll();
  }

  Future<void> updateSalary(SalaryModel val) async {
    final isar = await db;
    isar.writeTxn<int>(() async => await isar.salaryModels.put(val));
  }

  Future<void> deleteSalary(int val) async {
    final isar = await db;
    isar.writeTxn<bool>(() async => await isar.salaryModels.delete(val));
  }

  // sync salaries
  Future<void> salariesSync() async {
    final isar = await db;
    IsarCollection<SalaryModel> salaryCollection =
        isar.collection<SalaryModel>();

    final salary = await salaryCollection.where().findAll();
    /*if (salary.isNotEmpty) {
      final res = await _supabaseHelper.getSalarys();
      if (res.length != salary.length) {
        if (salary.length >= res.length) {
          await Future.forEach(salary, (val) async {
            final res = await _supabaseHelper.getSalariesById(val.id!);
            if (res == false) {
              _supabaseHelper.addSalary(val.toJson());
            }
          });
          final res = await _supabaseHelper.getSalarys();
          await insertSalaryFresh(res);
        } else {
          await insertSalaryFresh(res);
        }
      }
    } else {
      final res = await _supabaseHelper.getSalarys();
      await insertSalaryFresh(res);
    }*/
  }

  Future<void> clearSalary() async {
    final isar = await db;
    IsarCollection<SalaryModel> salaryCollection =
        isar.collection<SalaryModel>();
    isar.writeTxn<void>(() => salaryCollection.clear());
  }

  insertSalaryFresh(List<SalaryModel> salaryList) async {
    final isar = await db;
    await clearSalary();

    if (salaryList.isNotEmpty) {
      await Future.forEach(
          salaryList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.salaryModels.put(val)));
    }
  }

  // due payment
  // inventory
  Future<void> addDuePayment(MetodoPagoModel val) async {
    val.esSincronizado =
        isDeviceConnected.value;
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.metodoPagoModels.putSync(val));
  }

  Future<void> deleteDuePayment(int val) async {
    final isar = await db;
    isar.writeTxn<bool>(() async => await isar.metodoPagoModels.delete(val));
  }

  Future<void> updateDuePayment(MetodoPagoModel val) async {
    final isar = await db;
    isar.writeTxn<int>(() async => await isar.metodoPagoModels.put(val));
  }

  Future<List<MetodoPagoModel>> getDuePayments({String? value}) async {
    final isar = await db;
    IsarCollection<MetodoPagoModel> duePaymentCollection =
        isar.collection<MetodoPagoModel>();
    return await duePaymentCollection.where().findAll();
  }

  // sync due payment
  Future<void> duePaymentSync() async {
    final duePayments = await getDuePayments();
    /*if (duePayments.isNotEmpty) {
      final res = await _supabaseHelper.getDuePayment();
      if (res.length != duePayments.length) {
        if (duePayments.length >= res.length) {
          await Future.forEach(duePayments, (val) async {
            final res = await _supabaseHelper.getDuePaymentById(val.id!);
            if (res == false) {
              _supabaseHelper.addDuePayment(val.toJson());
            }
          });
          final res = await _supabaseHelper.getDuePayment();
          await insertDuePaymentFresh(res);
        } else {
          await insertDuePaymentFresh(res);
        }
      }
    } else {
      final res = await _supabaseHelper.getDuePayment();
      await insertDuePaymentFresh(res);
    }*/
  }

  Future<void> clearDuePayment() async {
    final isar = await db;
    IsarCollection<MetodoPagoModel> duePaymentCollection =
        isar.collection<MetodoPagoModel>();
    isar.writeTxn<void>(() => duePaymentCollection.clear());
  }

  insertDuePaymentFresh(List<MetodoPagoModel> duePaymentList) async {
    final isar = await db;
    await clearDuePayment();
    if (duePaymentList.isNotEmpty) {
      await Future.forEach(
          duePaymentList,
          (val) async =>
              await isar.writeTxn<int>(() => isar.metodoPagoModels.put(val)));
    }
  }

  Future<void> createdBackUp() async {
    final isar = await db;
    try {
      final productos = await isar.productoModels.where().findAll();
      final jsonList = productos.map((p) => p.toJson()).toList();
      final jsonString = jsonEncode(jsonList);

      final downloadsDir = await getDownloadsDirectory();
      final file = File('${downloadsDir!.path}/productos_backup.json');
      await file.writeAsString(jsonString);

      print(' Backup exportado a: ${file.path}');
    } catch (e) {
      print(' Error al exportar: $e');
    }
  }

  Future<void> createBackUp() async {
    final isar = await db;
    final backUpDir = await getDownloadsDirectory();

    final File backUpFile = File('${backUpDir?.path}/backup_db.isar');
    if (await backUpFile.exists()) {
      // if already we have another backup file, delete it here.
      await backUpFile.delete();
    }
    await isar.copyToFile('${backUpDir?.path}/backup_db.isar');
  }

  Future<void> restoreDB() async {
    final dbDirectory = await getApplicationDocumentsDirectory();
    final isar = await db;

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      await isar.close(deleteFromDisk: true).then((_) async {
        File targetFile = await file.copy("${dbDirectory.path}/default.isar");
        log("Correctly copied to ${targetFile.path}");
        await Isar.open(
          [
            ProductoModelSchema,
            ClienteModelSchema,
            VentaModelSchema,
            UsuarioModelSchema,
            AuthModelSchema,
            TiendaModelSchema,
            PresenceModelSchema,
            RentItemModelSchema,
            RentModelSchema,
            GastoModelSchema,
            SalaryModelSchema,
            MetodoPagoModelSchema,
            ClaveUsuarioModelSchema
          ],
          directory: dbDirectory.path,
        );
      });
    }
  }

  Future<void> clearAllData() async {
    final isar = await db;
    isar.writeTxn<void>(() => isar.clear());
    await isar.close(deleteFromDisk: true);
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [
          ProductoModelSchema,
          ClienteModelSchema,
          VentaModelSchema,
          UsuarioModelSchema,
          AuthModelSchema,
          TiendaModelSchema,
          PresenceModelSchema,
          RentItemModelSchema,
          RentModelSchema,
          GastoModelSchema,
          SalaryModelSchema,
          MetodoPagoModelSchema,
          ClaveUsuarioModelSchema
        ],
        directory: dir.path,
        inspector: true,
      );

      return isar;
    }

    return Future.value(Isar.getInstance());
  }
}

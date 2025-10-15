import 'dart:convert';
import 'dart:developer';

import 'package:due_kasir/model/cliente_model.dart';
import 'package:due_kasir/model/gasto_model.dart';
import 'package:due_kasir/model/metodo_pago_model.dart';
import 'package:due_kasir/model/presence_model.dart';
import 'package:due_kasir/model/producto_model.dart';
import 'package:due_kasir/model/rent_item_model.dart';
import 'package:due_kasir/model/request_model.dart';
import 'package:due_kasir/model/salary_model.dart';
import 'package:due_kasir/model/tienda_model.dart';
import 'package:due_kasir/model/usuario_model.dart';
import 'package:due_kasir/model/venta_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/rent_model.dart';

class SupabaseHelper {
  static final SupabaseClient supabase = Supabase.instance.client;

  Future<List<ProductoModel>> getInventoryAll() async {
    List data = [];
    List<ProductoModel> allInventory = [];

    final result = await supabase
        .from('producto')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id);
    if (result.isNotEmpty) {
      await Future.forEach(result, (val) async => data.add(val));
    }
    await Future.forEach(data, (val) async {
      allInventory.add(ProductoModel.fromJson(val));
    });

    return allInventory;
  }

  addInventory(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('producto').insert(data).then((value) {
      log('success add producto $value');
    }).catchError((error) {
      log('error add producto $error');
    });
  }

  removeInventory(int id) async {
    await supabase.from('producto').select().eq("id", id).then((value) async {
      await supabase.from('producto').delete().eq('id', id);
    });
  }

  updateInventory(ProductoModel item) async {
    await supabase
        .from('producto')
        .select()
        .eq("id", item.id!)
        .then((value) async {
      if (value.isEmpty) {
        addInventory(item.toJson());
      } else {
        await supabase
            .from('producto')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }

  // cliente
  Future<List<ClienteModel>> getCustomerAll() async {
    List<ClienteModel> allCustomer = [];

    await supabase
        .from('cliente')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id)
        .then(
      (val) {
        for (var element in val) {
          allCustomer.add(ClienteModel.fromJson(element));
        }
      },
    );

    return allCustomer;
  }

  addCustomer(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('cliente').insert(data).then((value) {
      log('success add cliente $value');
    }).catchError((error) {
      log('error add cliente $error');
    });
  }

  removeCustomer(int id) async {
    await supabase.from('cliente').select().eq("id", id).then((value) async {
      await supabase.from('cliente').delete().eq('id', id);
    });
  }

  Future<bool> getCustomerById(int id) async {
    final res = await supabase.from('cliente').select().eq("id", id);
    return res.isNotEmpty;
  }

  updateCustomer(ClienteModel item) async {
    await supabase
        .from('cliente')
        .select()
        .eq("id", item.id!)
        .then((value) async {
      if (value.isEmpty) {
        addInventory(item.toJson());
      } else {
        await supabase
            .from('cliente')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }

  Future<List<VentaModel>> getRepots({DateTime? start, DateTime? end}) async {
    List<VentaModel> allReport = [];

    List<Map<String, dynamic>> result;
    if (start != null && end != null) {
      result = await supabase
          .from('report')
          .select()
          .eq('usuario', supabase.auth.currentUser!.id)
          .gt('createdAt', start.toIso8601String())
          .lt('createdAt', end.toIso8601String());
    } else {
      result = await supabase
          .from('report')
          .select()
          .eq('usuario', supabase.auth.currentUser!.id);
    }

    if (result.isNotEmpty) {
      await Future.forEach(result, (val) async {
        final List<dynamic> convertItem = jsonDecode(val['items']);
        List<ProductItemModel> listProduct = [];
        await Future.forEach(convertItem, (p) async {
          listProduct.add(ProductItemModel.fromJson(p));
        });

        allReport.add(
          VentaModel(
            id: val['id'],
            cliente: val['comprador'],
            descuento: val['descuento'].toDouble(),
            usuario: val['cajero'],
            informacion: val['informacion'],
            productoTotal: val['totalItem'],
            precioTotal: val['precioTotal'].toDouble(),
            fechaCreacion: DateTime.parse(val['hechoEn']),
            items: listProduct,
          ),
        );
      });
    }

    return allReport;
  }

  addReport(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('report').insert(data).then((value) {
      log('success add producto $value');
    }).catchError((error) {
      log('error add producto $error');
    });
  }

  Future<bool> getReportById(int id) async {
    final res = await supabase.from('report').select().eq("id", id);
    return res.isNotEmpty;
  }

  removeReport(int id) async {
    await supabase.from('report').select().eq("id", id).then((value) async {
      await supabase.from('report').delete().eq('id', id);
    });
  }

  updateReport(VentaModel item) async {
    await supabase
        .from('report')
        .select()
        .eq("id", item.id!)
        .then((value) async {
      if (value.isEmpty) {
        addInventory(item.toJson());
      } else {
        await supabase
            .from('report')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }

  // presense
  addPresense(Map data) async {
    data.putIfAbsent('belong', () => supabase.auth.currentUser!.id);
    await supabase.from('presense').insert(data).then((value) {
      log('success add presense $value');
    }).catchError((error) {
      log('error add presense $error');
    });
  }

  Future<bool> getPresenseById(int id) async {
    final res = await supabase.from('presense').select().eq("id", id);
    return res.isNotEmpty;
  }

  Future<List<PresenceModel>> getPresense() async {
    List<PresenceModel> allPresense = [];

    final result = await supabase
        .from('presense')
        .select()
        .eq('belong', supabase.auth.currentUser!.id);

    if (result.isNotEmpty) {
      await Future.forEach(result, (val) async {
        allPresense.add(PresenceModel.fromJson(val));
      });
    }
    return allPresense;
  }

  // rent item
  addRentItem(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('rent_items').insert(data).then((value) {
      log('success add presense $value');
    }).catchError((error) {
      log('error add presense $error');
    });
  }

  Future<bool> getRentItemById(int id) async {
    final res = await supabase.from('rent_items').select().eq("id", id);
    return res.isNotEmpty;
  }

  Future<List<RentItemModel>> getRentItems() async {
    List<RentItemModel> rentItems = [];

    final result = await supabase
        .from('rent_items')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id);

    if (result.isNotEmpty) {
      await Future.forEach(result, (val) async {
        rentItems.add(RentItemModel.fromJson(val));
      });
    }
    return rentItems;
  }

  removeRentItem(int id) async {
    await supabase.from('rent_items').select().eq("id", id).then((value) async {
      await supabase.from('rent_items').delete().eq('id', id);
    });
  }

  updateRentItem(RentItemModel item) async {
    await supabase
        .from('rent_items')
        .select()
        .eq("id", item.id!)
        .then((value) async {
      if (value.isEmpty) {
        addRentItem(item.toJson());
      } else {
        await supabase
            .from('rent_items')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }

  // rent
  addRent(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('rent').insert(data).then((value) {
      log('success add presense $value');
    }).catchError((error) {
      log('error add presense $error');
    });
  }

  Future<List<RentModel>> getRent() async {
    List<RentModel> rentItems = [];

    final result = await supabase
        .from('rent')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id);

    if (result.isNotEmpty) {
      await Future.forEach(result, (val) async {
        rentItems.add(RentModel.fromJson(val));
      });
    }
    return rentItems;
  }

  Future<bool> getRentById(int id) async {
    final res = await supabase.from('rent').select().eq("id", id);
    return res.isNotEmpty;
  }

  updateRent(RentModel item) async {
    await supabase.from('rent').select().eq("id", item.id!).then((value) async {
      if (value.isEmpty) {
        addRent(item.toJson());
      } else {
        await supabase
            .from('rent')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }

  // expenses
  addExpenses(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('expenses').insert(data).then((value) {
      log('success add expanses $value');
    }).catchError((error) {
      log('error add expanses $error');
    });
  }

  removeExpenses(int id) async {
    await supabase.from('expenses').select().eq("id", id).then((value) async {
      await supabase.from('expenses').delete().eq('id', id);
    });
  }

  Future<List<GastoModel>> getExpenses() async {
    List<GastoModel> expensesItems = [];

    final result = await supabase
        .from('expenses')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id);

    if (result.isNotEmpty) {
      await Future.forEach(result, (val) async {
        expensesItems.add(GastoModel.fromJson(val));
      });
    }
    return expensesItems;
  }

  Future<bool> getExpensesById(int id) async {
    final res = await supabase.from('rent').select().eq("id", id);
    return res.isNotEmpty;
  }

  // tienda
  addStore(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('tienda').insert(data).then((value) {
      log('success add tienda $value');
    }).catchError((error) {
      log('error add tienda $error');
    });
  }

  Future<TiendaModel?> getStore() async {
    final result = await supabase
        .from('tienda')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id);
    return result.isEmpty ? null : TiendaModel.fromJson(result.first);
  }

  updateStore(TiendaModel item) async {
    await supabase
        .from('tienda')
        .select()
        .eq("id", item.id!)
        .then((value) async {
      if (value.isEmpty) {
        addStore(item.toJson());
      } else {
        await supabase
            .from('tienda')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }

  // usuario
  addUsers(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('usuarios').insert(data).then((value) {
      log('success add usuarios $value');
    }).catchError((error) {
      log('error add usuarios $error');
    });
  }

  Future<bool> getUserById(int id) async {
    final res = await supabase.from('usuarios').select().eq("id", id);
    return res.isNotEmpty;
  }

  Future<List<UsuarioModel>> getUsers() async {
    List<UsuarioModel> usuarios = [];

    final result = await supabase
        .from('usuarios')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id);

    if (result.isNotEmpty) {
      await Future.forEach(result, (val) async {
        usuarios.add(UsuarioModel.fromJson(val));
      });
    }
    return usuarios;
  }

  removeUsers(int id) async {
    await supabase.from('usuarios').select().eq("id", id).then((value) async {
      await supabase.from('usuarios').delete().eq('id', id);
    });
  }

  updateUsers(UsuarioModel item) async {
    await supabase
        .from('usuarios')
        .select()
        .eq("id", item.id!)
        .then((value) async {
      if (value.isEmpty) {
        addUsers(item.toJson());
      } else {
        await supabase
            .from('usuarios')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }

  // salary
  addSalary(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('salary').insert(data).then((value) {
      log('success add presesalarynse $value');
    }).catchError((error) {
      log('error add salary $error');
    });
  }

  removeSalary(int id) async {
    await supabase.from('salary').select().eq("id", id).then((value) async {
      await supabase.from('salary').delete().eq('id', id);
    });
  }

  Future<bool> getSalariesById(int id) async {
    final res = await supabase.from('salary').select().eq("id", id);
    return res.isNotEmpty;
  }

  Future<List<SalaryModel>> getSalarys() async {
    List<SalaryModel> salaryItems = [];

    final result = await supabase
        .from('salary')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id);

    if (result.isNotEmpty) {
      await Future.forEach(result, (val) async {
        List<ItemSalary> items = [];
        await Future.forEach(val['items'], (p) async {
          items.add(ItemSalary.fromJson(p));
        });

        List<ItemSalary> deductions = [];
        if (val['deductions'] != null) {
          await Future.forEach(val['deductions'], (p) async {
            deductions.add(ItemSalary.fromJson(p));
          });
        }

        salaryItems.add(
          SalaryModel(
            id: val['id'],
            periode: val['periode'],
            status: val['status'],
            total: val['total'].toInt(),
            userId: val['userId'].toInt(),
            note: val['note'],
            items: items,
            deductions: deductions,
            createdAt: val['createdAt'] != null
                ? DateTime.parse(val['createdAt'])
                : null,
          ),
        );
      });
    }
    return salaryItems;
  }

  updateSalary(SalaryModel item) async {
    await supabase
        .from('salary')
        .select()
        .eq("id", item.id!)
        .then((value) async {
      if (value.isEmpty) {
        addRent(item.toJson());
      } else {
        await supabase
            .from('salary')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }

  // due payment
  Future<List<MetodoPagoModel>> getDuePayment() async {
    List data = [];
    List<MetodoPagoModel> duePayments = [];

    final result = await supabase
        .from('metodo_pago')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id);
    if (result.isNotEmpty) {
      await Future.forEach(result, (val) async => data.add(val));
    }
    await Future.forEach(data, (val) async {
      duePayments.add(MetodoPagoModel.fromJson(val));
    });

    return duePayments;
  }

  addDuePayment(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('metodo_pago').insert(data).then((value) {
      log('success add due payment $value');
    }).catchError((error) {
      log('error add due payment $error');
    });
  }

  Future<bool> getDuePaymentById(int id) async {
    final res = await supabase.from('metodo_pago').select().eq("id", id);
    return res.isNotEmpty;
  }

  removeDuePayment(int id) async {
    await supabase
        .from('metodo_pago')
        .select()
        .eq("id", id)
        .then((value) async {
      await supabase.from('metodo_pago').delete().eq('id', id);
    });
  }

  updateDuePayment(MetodoPagoModel item) async {
    await supabase
        .from('metodo_pago')
        .select()
        .eq("id", item.id!)
        .then((value) async {
      if (value.isEmpty) {
        addDuePayment(item.toJson());
      } else {
        await supabase
            .from('metodo_pago')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }

  // request
  addRequest(Map data) async {
    data.putIfAbsent('usuario', () => supabase.auth.currentUser!.id);
    await supabase.from('request').insert(data).then((value) {
      log('success add request $value');
    }).catchError((error) {
      log('error add request $error');
    });
  }

  removeRequest(int id) async {
    await supabase.from('request').select().eq("id", id).then((value) async {
      await supabase.from('request').delete().eq('id', id);
    });
  }

  Future<bool> getRequestId(int id) async {
    final res = await supabase.from('request').select().eq("id", id);
    return res.isNotEmpty;
  }

  Future<List<RequestModel>> getRequests() async {
    List<RequestModel> requestItems = [];

    final result = await supabase
        .from('request')
        .select()
        .eq('usuario', supabase.auth.currentUser!.id);

    await Future.forEach(result, (val) async {
      requestItems.add(RequestModel.fromJson(val));
    });

    return requestItems;
  }

  updateRequest(RequestModel item) async {
    await supabase
        .from('request')
        .select()
        .eq("id", item.id!)
        .then((value) async {
      if (value.isEmpty) {
        addRent(item.toJson());
      } else {
        await supabase
            .from('request')
            .update(item.toJson())
            .match({'id': item.id!});
      }
    });
  }
}

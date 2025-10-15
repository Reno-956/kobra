import 'package:due_kasir/model/cliente_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:signals/signals_flutter.dart';

class ClienteController {
  final searchCustomer = signal<String?>(null);
  final clientes = futureSignal(() async =>
      Database().obtenerClientesPorCampo(value: clienteController.searchCustomer.value));
  final customerSelected = signal<ClienteModel?>(null);
}

final clienteController = ClienteController();

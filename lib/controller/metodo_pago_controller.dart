import 'package:due_kasir/model/metodo_pago_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:signals/signals_flutter.dart';

class MetodoPagoController {
  final payments = futureSignal(() async => Database().getDuePayments());
  final paymentSelected = signal<MetodoPagoModel?>(null);
}

final duePaymentController = MetodoPagoController();

import 'package:due_kasir/service/database.dart';
import 'package:signals/signals_flutter.dart';

class TiendaController {
  final tienda = futureSignal(() async => Database().obtenerTienda());
}

final tiendaController = TiendaController();

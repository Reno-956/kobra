import 'package:due_kasir/model/venta_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:signals/signals_flutter.dart';

class ReportController {
  final dateRange = listSignal(
      [DateTime.now().subtract(const Duration(days: 31)), DateTime.now()]);
  final reporte = futureSignal(
    () async => Database().obtenerReportes(
        start: reportController.dateRange.first,
        end: reportController.dateRange.last),
  );
  final reporteHoy = futureSignal(() async => Database().obtenerReporteHoy());
  final reporteAyer =
      futureSignal(() async => Database().obtenerReporteAyer());
  final reporteUsuario = futureSignal(() async => Database().obtenerVentasPorUser());
  final reporetIngresos = futureSignal(
    () async => Database().obtenerVentasPorFecha(
        start: reportController.dateRange.first,
        end: reportController.dateRange.last),
  );
  final reporteAgotado = futureSignal(() async => Database().obtenerProdcutoSinStock());
  final masVendido = listSignal<ProductItemModel>([], autoDispose: true);
  final rentRevenue = futureSignal(() async => Database().getRentRevenue());
}

final reportController = ReportController();

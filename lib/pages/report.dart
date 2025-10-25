import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:due_kasir/controller/expenses_controller.dart';
import 'package:due_kasir/controller/producto_controller.dart';
import 'package:due_kasir/controller/report_controller.dart';
import 'package:due_kasir/model/cliente_model.dart';
import 'package:due_kasir/model/usuario_model.dart';
import 'package:due_kasir/model/venta_model.dart';
import 'package:due_kasir/pages/drawer.dart';
import 'package:due_kasir/pages/report/report_bestseller.dart';
import 'package:due_kasir/pages/report/report_delete_dialog.dart';
import 'package:due_kasir/pages/report/report_out_of_stock_all.dart';
import 'package:due_kasir/pages/report/report_revenue.dart';
import 'package:due_kasir/pages/report/report_sales.dart';
import 'package:due_kasir/pages/report/report_sync_dialog.dart';
import 'package:due_kasir/pages/report/report_visitor_weekly.dart';
import 'package:due_kasir/pages/report/report_visitors.dart';
import 'package:due_kasir/service/database.dart';
import 'package:due_kasir/utils/constant.dart';
import 'package:due_kasir/utils/date_utils.dart';
import 'package:due_kasir/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

final isRefreshReport = signal(false);

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final isLoading = isRefreshReport.watch(context);
    final dateRange = reportController.dateRange.watch(context);
    final isMobile = context.isMobile;
    final reporte = reportController.reporte.watch(context);
    final reporteHoy = reportController.reporteHoy.watch(context);
    final reporteAgotado = reportController.reporteAgotado.watch(context);
    final theme = ShadTheme.of(context);
    final screen = isMobile ? context.width : (context.width - 60) / 3;
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Reporte'),
        centerTitle: false,
        actions: [
          ShadButton.ghost(
            onPressed: isLoading
                ? null
                : () async {
                    isRefreshReport.value = true;
                    await reportController.reporte.refresh();
                    await reportController.reporteHoy.refresh();
                    await reportController.reporteAyer.refresh();
                    await reportController.reporteAgotado.refresh();
                    await Future.delayed(Durations.medium1);
                    isRefreshReport.value = false;
                  },
            icon: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.refresh,
                size: 16,
              ),
            ),
            child: Text(isLoading ? 'Cargango...' : 'Refrescar'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ShadButton.outline(
                    child: Text(
                        'Filtrar: ${dateWithoutTime.format(dateRange.first)} - ${dateWithoutTime.format(dateRange.last)}'),
                    onPressed: () async {
                      var results = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(
                          calendarType: CalendarDatePicker2Type.range,
                        ),
                        dialogSize: const Size(325, 400),
                        value: dateRange,
                        borderRadius: BorderRadius.circular(15),
                      );
                      if (results != null) {
                        reportController.dateRange.value = [
                          results.first!,
                          results.last!
                        ];
                      }
                    }),
                ShadButton(
                  child: const Text('Resetear'),
                  onPressed: () => reportController.dateRange.value = [
                    DateTime.now().subtract(const Duration(days: 30)),
                    DateTime.now()
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                Column(
                  children: [
                    ShadCard(
                      width: screen,
                      title: Text(
                          currency.format(sumaReport(reporteHoy.value ?? [])),
                          style: theme.textTheme.h4),
                      description: const Text('Ventas totales hoy'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                if (reporte.hasValue)
                  Column(
                    children: [
                      ShadCard(
                        width: screen,
                        title: Text(
                            currency.format(sumaReport(reporte.value ?? [])),
                            style: theme.textTheme.h4),
                        description: const Text('Ganancias'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                ReportVisitors(width: screen),
                ShadCard(
                  width: screen,
                  title: const Text('Agotado'),
                  description: Text(
                      'Tienes ${reporteAgotado.value?.length} productos agotados.'),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      if (reporteAgotado.hasValue) ...[
                        ...reporteAgotado.value!.take(2).map(
                              (n) => Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        margin: const EdgeInsets.only(top: 4),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${n.descripcion} ${n.medida} - ${n.cantidadProducto}',
                                                  style: theme.textTheme.small),
                                              const SizedBox(height: 4),
                                              Text(
                                                  '${currency.format(n.precioUnitario)} - ${n.codigoPrincipal}',
                                                  style: theme.textTheme.muted),
                                            ],
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            productoController
                                                .productoSelected.value = n;
                                            context.go('/inventory/form');
                                          },
                                          icon: const Icon(Icons.arrow_right)
                                      )
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                        ShadButton(
                          width: double.infinity,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportOutOfStock(
                                      items: reporteAgotado.value!)),
                            );
                          },
                          child: const Text('Ver todo'),
                        ),
                      ]
                    ],
                  ),
                ),
                ReportBestSeller(width: screen),
              ],
            ),
            const SizedBox(height: 20),
            ShadCard(
              title: const Text('Lista de ventas'),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    ShadAccordion<VentaModel>.multiple(
                      children: (reporte.value ?? []).reversed.take(5).map(
                            (detail) => ShadAccordionItem(
                              value: detail,
                              title: Container(
                                decoration: BoxDecoration(
                                  color: detail.esSincronizado == false
                                    ? Colors.orange
                                    : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: [
                                        FutureBuilder<ClienteModel?>(
                                          future: detail.cliente == null
                                              ? Future.value(null)
                                              : Database().obtenerClientePorId(detail.cliente!),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                                              return Text(
                                                '${snapshot.data?.nombre ?? 'Consumidor Final'} -',
                                              );
                                            }
                                            return const Text('Consumidor Final -');
                                          },
                                        ),
                                        FutureBuilder<UsuarioModel?>(
                                          future: Database().obtenerUserPorId(detail.usuario),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(snapshot.data?.nombre ?? 'Admin');
                                            }
                                            return const Text('Admin');
                                          },
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: [
                                        Text(
                                          '${currency.format(detail.precioTotal)} (${detail.productoTotal.toString()})',
                                          style: ShadTheme.of(context).textTheme.small,
                                        ),
                                        Text(
                                          dateDayWithTime.format(detail.fechaCreacion),
                                          style: ShadTheme.of(context).textTheme.muted,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ...detail.items.map(
                                    (val) => ListTile(
                                      title: Text(
                                          '${val.descripcion} ${val.medida} - ${val.codigoPrincipal}'),
                                      subtitle: Row(
                                        children: [
                                          Text('${val.cantidad} x '),
                                          Text(currency.format(val.precioUnitario!)),
                                        ],
                                      ),
                                      trailing: Text(currency.format(
                                          val.precioUnitario! * val.cantidad!)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (detail.esSincronizado == false)
                                        ShadButton.secondary(
                                          onPressed: () {
                                            showShadDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ReportSyncDialog(
                                                id: detail.id!,
                                                detail: detail,
                                              ),
                                            );
                                          },
                                          icon: const Padding(
                                            padding: EdgeInsets.only(right: 8),
                                            child: Icon(
                                              Icons.sync,
                                              size: 16,
                                            ),
                                          ),
                                          child: const Text('Sincronizar'),
                                        ),
                                      ShadButton.outline(
                                        onPressed: () {
                                          showShadDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ReportDeleteDialog(
                                                      id: detail.id!));
                                        },
                                        icon: const Padding(
                                          padding: EdgeInsets.only(right: 8),
                                          child: Icon(
                                            Icons.delete,
                                            size: 16,
                                          ),
                                        ),
                                        child: const Text('Borrar'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ShadButton(
                        onPressed: () {
                          final ventasRecientes = reporte.value?.reversed.toList() ?? [];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportSales(
                                    ventas: ventasRecientes)),
                          );
                        },
                        child: const Text('Ver todo'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const ShadCard(
              title: Text('Informe de ingresos por día'),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: ReportRevenue(),
              ),
            ),
            const SizedBox(height: 20),
            const ReportVisitorWeekLy(),
          ],
        ),
      ),
    );
  }
}

import 'package:due_kasir/pages/report/report_delete_dialog.dart';
import 'package:due_kasir/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../model/cliente_model.dart';
import '../../model/usuario_model.dart';
import '../../model/venta_model.dart';
import '../../service/database.dart';
import '../../utils/date_utils.dart';

class ReportSales extends StatelessWidget {
  final List<VentaModel> ventas;

  const ReportSales({super.key, required this.ventas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventas Totales'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: ventas.map((venta) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: venta.esSincronizado == false
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
                            future: venta.cliente == null
                                ? Future.value(null)
                                : Database().obtenerClientePorId(venta.cliente!),
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
                            future: Database().obtenerUserPorId(venta.usuario),
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
                            '${currency.format(venta.precioTotal)} (${venta.productoTotal})',
                            style: ShadTheme.of(context).textTheme.small,
                          ),
                          Text(
                            dateDayWithTime.format(venta.fechaCreacion),
                            style: ShadTheme.of(context).textTheme.muted,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                ...venta.items.map(
                      (val) => ListTile(
                    title: Text('${val.descripcion} ${val.medida} - ${val.codigoPrincipal}'),
                    subtitle: Row(
                      children: [
                        Text('${val.cantidad} x '),
                        Text(currency.format(val.precioUnitario ?? 0)),
                      ],
                    ),
                    trailing: Text(
                      currency.format(
                        (val.precioUnitario ?? 0) * (val.cantidad ?? 0),
                      ),
                    ),
                  ),
                ),
                ShadButton.outline(
                  onPressed: () {
                    showShadDialog(
                        context: context,
                        builder: (context) =>
                            ReportDeleteDialog(
                                id: venta.id!));
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
                const Divider(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

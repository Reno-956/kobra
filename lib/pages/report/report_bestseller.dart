import 'package:collection/collection.dart';
import 'package:due_kasir/controller/report_controller.dart';
import 'package:due_kasir/model/venta_model.dart';
import 'package:due_kasir/pages/report/report_bestseller_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

final totalItem = Signal(0, autoDispose: true);

class ReportBestSeller extends HookWidget {
  final double width;

  const ReportBestSeller({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final items = reportController.masVendido.watch(context);
    reportController.reporte.listen(context, () {
      final List<VentaModel>? listValue = reportController.reporte.value.value;
      if (listValue != null) {
        if (totalItem.value != listValue.length) {
          totalItem.value = listValue.length;
          final Map<int, ProductItemModel> prodcutos = {};
          for (var venta in listValue) {
            for (var item in venta.items) {
              if (prodcutos.containsKey(item.id)) {
                prodcutos[item.id]!.cantidad =
                    (prodcutos[item.id]!.cantidad ?? 0) + (item.cantidad ?? 0);
              } else {
                prodcutos[item.id!] = ProductItemModel.fromJson(item.toJson())
                  ..cantidad = item.cantidad ?? 0;
              }
            }
          }
          items
            ..clear()
            ..addAll(prodcutos.values);
        }
      }
    });

    final theme = ShadTheme.of(context);
    return ShadCard(
      width: width,
      title: const Text('Más vendido'),
      description: const Text('Prodcutos más vendidos'),
      child: Column(
        children: [
          const SizedBox(height: 16),
          ...items
              .sorted((a, b) => b.cantidad!.compareTo(a.cantidad!))
              .take(2)
              .map(
                (n) => Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${n.descripcion} ${n.medida}',
                                    style: theme.textTheme.small),
                                const SizedBox(height: 4),
                                Text(' ${n.cantidad} Vendidos',
                                    style: theme.textTheme.muted),
                              ],
                            ),
                          ),
                        ),
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
                    builder: (context) => ReportBestSellerAll(items: items)),
              );
            },
            child: const Text('Ver todo'),
          ),
        ],
      ),
    );
  }
}

import 'package:due_kasir/controller/report_controller.dart';
import 'package:due_kasir/pages/report/report_visitors_all.dart';
import 'package:due_kasir/utils/constant.dart';
import 'package:due_kasir/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

class ReportVisitors extends StatelessWidget {
  final double width;

  ReportVisitors({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final reportIncome = reportController.reporetIngresos.watch(context);
    return ShadCard(
      width: width,
      title: const Text('Clientes Totales'),
      description: const Text('¿Cuantas personas vienen a comprar?'),
      child: Column(
        children: [
          const SizedBox(height: 16),
          if (reportIncome.hasValue) ...[
            for (var i in reportIncome.value!.entries.toList().reversed.take(2))
              Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(dateWithoutTime.format(i.key)),
                    subtitle: Text(
                      currency.format(
                          i.value.fold(0, (p, c) => p + c.precioTotal.toInt())),
                    ),
                    trailing: Text('${i.value.length} Personas',
                        style: ShadTheme.of(context).textTheme.muted),
                  ),
                  const Divider()
                ],
              ),
            ShadButton(
              width: double.infinity,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReportVisitorAll(items: reportIncome.value!)),
                );
              },
              child: const Text('Ver todo'),
            ),
          ]
        ],
      ),
    );
  }
}

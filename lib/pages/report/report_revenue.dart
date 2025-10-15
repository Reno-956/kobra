import 'package:due_kasir/controller/report_controller.dart';
import 'package:due_kasir/model/venta_model.dart';
import 'package:due_kasir/utils/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class ReportRevenue extends StatelessWidget {
  const ReportRevenue({super.key});

  @override
  Widget build(BuildContext context) {
    final reportIncome = reportController.reporetIngresos.watch(context);
    if (reportIncome.hasValue && reportIncome.value != null) {
      return SizedBox(
        height: 250,
        child: LineChart(mainData(reportIncome.value!)),
      );
    }
    return const SizedBox();
  }

  LineChartData mainData(Map<DateTime, List<VentaModel>> data) {
    final now = DateTime.now();
    final currentMonthData = data.entries
        .where((e) => e.key.month == now.month && e.key.year == now.year)
        .toList();
    final daysInMonth = DateUtils.getDaysInMonth(now.year, now.month);
    final ventasPorDia = currentMonthData.map((e) {
      return e.value.fold(0.0, (p, c) => p + c.precioTotal);
    }).toList();
    final maxVenta = ventasPorDia.isNotEmpty
        ? ventasPorDia.reduce((a, b) => a > b ? a : b)
        : 0.0;
    final maxY = (maxVenta + 30).ceilToDouble();
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: Text('Día'),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 50),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 1,
      maxX: DateUtils.getDaysInMonth(now.year, now.month).toDouble(),
      minY: 0,
      maxY: maxY,
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                currency.format(spot.y),
                const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              );
            }).toList();
          },
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            for (var entry in currentMonthData)
              FlSpot(
                entry.key.day.toDouble(),
                entry.value.fold(0, (p, c) => p + c.precioTotal),
              ),
          ],
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}

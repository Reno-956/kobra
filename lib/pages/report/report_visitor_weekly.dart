import 'package:due_kasir/controller/report_controller.dart';
import 'package:due_kasir/model/venta_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

class ReportVisitorWeekLy extends StatefulWidget {
  const ReportVisitorWeekLy({super.key});

  @override
  State<ReportVisitorWeekLy> createState() => _ReportVisitorWeekLyState();
}

class _ReportVisitorWeekLyState extends State<ReportVisitorWeekLy> {
  bool loading = true;
  List<MapEntry<DateTime, List<VentaModel>>> sun = [];
  List<MapEntry<DateTime, List<VentaModel>>> mon = [];
  List<MapEntry<DateTime, List<VentaModel>>> tue = [];
  List<MapEntry<DateTime, List<VentaModel>>> wed = [];
  List<MapEntry<DateTime, List<VentaModel>>> thu = [];
  List<MapEntry<DateTime, List<VentaModel>>> fri = [];
  List<MapEntry<DateTime, List<VentaModel>>> sat = [];

  @override
  void initState() {
    final reportIncome = reportController.reporteIngresos.watch(context);
    if (reportIncome.value != null) {
      initiateData(reportIncome.value!);
    } else {
      loading = false;
    }
    super.initState();
  }

  Future<void> initiateData(Map<DateTime, List<VentaModel>> data) async {
    sun.clear();
    mon.clear();
    tue.clear();
    wed.clear();
    thu.clear();
    fri.clear();
    sat.clear();

    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    final filtered = data.entries.where((entry) {
      final date = entry.key;
      return date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
          date.isBefore(endOfWeek.add(const Duration(days: 1)));
    });

    for (var i in filtered) {
      switch (i.key.weekday) {
        case DateTime.monday:
          mon.add(i);
          break;
        case DateTime.tuesday:
          tue.add(i);
          break;
        case DateTime.wednesday:
          wed.add(i);
          break;
        case DateTime.thursday:
          thu.add(i);
          break;
        case DateTime.friday:
          fri.add(i);
          break;
        case DateTime.saturday:
          sat.add(i);
          break;
        case DateTime.sunday:
          sun.add(i);
          break;
      }
    }
    await Future.delayed(Durations.long1);
    loading = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final reportIncome = reportController.reporteIngresos.watch(context);
    return ShadCard(
      title: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: [
          const Text('Visitantes semanales'),
          ShadButton.ghost(
            onPressed: () async {
              setState(() {
                loading = true;
              });
              if (reportIncome.hasValue) {
                initiateData(reportIncome.value!);
              } else {
                setState(() {
                  loading = false;
                });
              }
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 4),
              child: Icon(
                Icons.refresh,
                size: 16,
              ),
            ),
            child: const Text('Refrescar'),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: 250,
                child: BarChart(
                  BarChartData(
                    barTouchData: barTouchData,
                    titlesData: titlesData,
                    borderData: borderData,
                    barGroups: barGroups,
                    gridData: const FlGridData(show: false),
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 20,
                  ),
                ),
              ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'L';
        break;
      case 1:
        text = 'M';
        break;
      case 2:
        text = 'X';
        break;
      case 3:
        text = 'J';
        break;
      case 4:
        text = 'V';
        break;
      case 5:
        text = 'S';
        break;
      case 6:
        text = 'D';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          Colors.blue,
          Colors.cyan,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: mon.fold(0, (p, c) => p + c.value.length),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: tue.fold(0, (p, c) => p + c.value.length),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: wed.fold(0, (p, c) => p + c.value.length),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: thu.fold(0, (p, c) => p + c.value.length),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: fri.fold(0, (p, c) => p + c.value.length),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: sat.fold(0, (p, c) => p + c.value.length),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: sun.fold(0, (p, c) => p + c.value.length),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

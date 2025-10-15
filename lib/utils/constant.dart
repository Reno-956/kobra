import 'package:due_kasir/model/venta_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final currency =
    NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 2);

ButtonStyle active = ElevatedButton.styleFrom(
  minimumSize: const Size.fromHeight(50),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);

ButtonStyle nonActive = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
  minimumSize: const Size.fromHeight(50),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);

double sumReport(List<VentaModel> numbers) {
  double sum = 0;

  for (var i in numbers) {
    sum = sum + i.precioTotal;
  }
  return sum;
}

converColor(int index) {
  if (index == 1) {
    return Colors.green;
  } else if (index == 2) {
    return Colors.blue;
  } else {
    return Colors.yellow;
  }
}

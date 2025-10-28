enum TypePayment {
  cash,
  qris,
  transfer;

  String get message {
    return switch (this) {
      cash => 'Efectivo',
      transfer => 'Transferencia',
      qris => 'Credito',
    };
  }
}

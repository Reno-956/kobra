enum TypePayment {
  cash,
  qris,
  transfer;

  String get message {
    return switch (this) {
      cash => 'Efectivo',
      qris => 'Credito',
      transfer => 'Transferencia',
    };
  }
}

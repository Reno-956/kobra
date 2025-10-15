enum TypePayment {
  cash,
  qris,
  transfer;

  String get message {
    return switch (this) {
      cash => 'Contado',
      qris => 'Credito',
      transfer => 'Transferencia',
    };
  }
}

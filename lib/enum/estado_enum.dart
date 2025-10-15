enum TipoEstado {
  act,
  des;

  String get message {
    return switch (this) {
      act => 'ACT',
      des => 'DES',
    };
  }
}
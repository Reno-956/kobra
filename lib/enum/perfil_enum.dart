enum TipoPerfil {
  user,
  admin,
  superAdmin;

  String get message {
    return switch (this) {
      user => 'User',
      admin => 'Admin',
      superAdmin => 'Super Admin',
    };
  }
}
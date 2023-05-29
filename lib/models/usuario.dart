class Usuario {
  String? email;
  String? senha;
  bool? estaLogado;

  Usuario({
    this.email,
    this.senha,
    this.estaLogado,
  });

  factory Usuario.fromJson(Map json) {
    return Usuario(
      email: json['email'] ?? '',
      senha: json['senha'] ?? '',
      estaLogado: json['estaLogado'] ?? '',
    );
  }
}

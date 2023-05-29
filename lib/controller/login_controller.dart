class LoginController {
  String? validaCampos(String? value) {
    var cleanSpace = value!.trim().isEmpty;
    if (cleanSpace) {
      return 'Campo Obrigatorio.';
    }

    return null;
  }

  String? validaEmail(String? value) {
    var verificaEmail = value!.contains('@');
    if (verificaEmail) {
      return null;
    }

    return 'E-mail incorreto';
  }
}

import 'package:flutter/material.dart';
import 'package:mentoria_flutter/models/usuario.dart';
import 'package:mentoria_flutter/repositories/local_data/cache/user_login_shared_preferences.dart';
import 'package:mentoria_flutter/views/inicio.dart';
import 'package:mentoria_flutter/views/login/login_screen.dart';

import '../../shared/progress.dart';

class BuscaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserLoginSharedPreferences userLoginSharedPreferences =
        UserLoginSharedPreferences();
    return Scaffold(
      body: FutureBuilder<Map>(
        future: userLoginSharedPreferences.buscaDadosSalvos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(mensagem: 'Carregando');
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return LoginScreen();
                } else {
                  var email = snapshot.data!['email'];
                  var senha = snapshot.data!['senha'];
                  var user = Usuario(
                    email: email,
                    senha: senha,
                    estaLogado: true,
                  );
                  return InicioScreen(user);
                }
              }
          }
          return Progress(mensagem: 'Carregando');
        },
      ),
    );
  }
}

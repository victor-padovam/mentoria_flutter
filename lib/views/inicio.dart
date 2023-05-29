import 'package:flutter/material.dart';
import 'package:mentoria_flutter/models/usuario.dart';
import 'package:mentoria_flutter/repositories/local_data/cache/user_login_shared_preferences.dart';
import 'package:mentoria_flutter/views/login/login_screen.dart';

import '../repositories/local_data/busca_historico.dart';
import '../shared/layout_dos_card.dart';
import 'coleta/form_coleta.dart';

class InicioScreen extends StatelessWidget {
  final Usuario usuario;
  const InicioScreen(this.usuario, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserLoginSharedPreferences userLoginSP = UserLoginSharedPreferences();
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
        title: const Text(
          "O que vamos fazer hoje?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () async {
                await userLoginSP.limpaUserLogin(usuario);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (Route<dynamic> route) => false);
              },
              icon: Icon(
                Icons.logout,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 30,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BuscaHitorico(),
                      ),
                    );
                  },
                  child: layoutDosCard(
                    'Hitorico',
                    Icons.history,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FormColeta(),
                      ),
                    );
                  },
                  child: layoutDosCard(
                    'Nova Coleta',
                    Icons.add,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:mentoria_flutter/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginSharedPreferences {
  final String _key = 'usuario_login';

  Future<void> save(Usuario usuario) async {
    var prefs = await SharedPreferences.getInstance();
    var verificaDados = prefs.getString(_key);

    if (verificaDados == null) {
      //Salva
      prefs.setString(
        _key,
        jsonEncode({
          'email': usuario.email,
          'senha': usuario.senha,
          'estaLogado': usuario.estaLogado,
        }),
      );
    } else {
      var mapDadosUpdate = jsonDecode(verificaDados);
      mapDadosUpdate['email'] = usuario.email;
      mapDadosUpdate['senha'] = usuario.senha;
      mapDadosUpdate['estaLogado'] = usuario.estaLogado;
      prefs.setString(_key, jsonEncode(mapDadosUpdate));
    }
  }

  Future<bool> verificaSeOUsuarioEstaAutenticado() async {
    var prefs = await SharedPreferences.getInstance();
    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      var verifica = mapUser['estaLogado'];

      return verifica;
    }

    return false;
  }

  Future<Map> buscaDadosSalvos() async {
    var mapUser = {};
    var prefs = await SharedPreferences.getInstance();
    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      mapUser = jsonDecode(jsonResult);
    }

    return mapUser;
  }

  Future limpaUserLogin(Usuario usuario) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var verificaDados = preferences.getString(_key);
    if (verificaDados != null) {
      var mapDadosUpdate = jsonDecode(verificaDados);
      mapDadosUpdate['email'] = usuario.email;
      mapDadosUpdate['senha'] = usuario.senha;
      mapDadosUpdate['estaLogado'] = false;
      preferences.setString(_key, jsonEncode(mapDadosUpdate));
    }
  }
}

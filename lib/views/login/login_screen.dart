import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mentoria_flutter/controller/login_controller.dart';
import 'package:mentoria_flutter/models/usuario.dart';
import 'package:mentoria_flutter/repositories/local_data/cache/user_login_shared_preferences.dart';
import 'package:mentoria_flutter/views/inicio.dart';
import 'package:mentoria_flutter/views/registro/registro_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserLoginSharedPreferences userLoginSharedPreferences =
      UserLoginSharedPreferences();
  LoginController loginController = LoginController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Acesse sua conta',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constaints) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Lottie.asset(
                'assets/login_animate.json',
                repeat: true,
                reverse: true,
                animate: true,
                height: 300,
                width: 400,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          16.0,
                          80.0,
                          16.0,
                          16.0,
                        ),
                        child: TextFormField(
                          controller: usuarioController,
                          validator: loginController.validaEmail,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 5.0),
                            labelText: 'E-mail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                        child: TextFormField(
                          obscureText: true,
                          validator: loginController.validaCampos,
                          controller: senhaController,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 5.0),
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegistroScreen(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'Ainda não possui sua conta?',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: InkWell(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              Map buscaDadosEmCache =
                  await userLoginSharedPreferences.buscaDadosSalvos();
              if (buscaDadosEmCache['email'] == usuarioController.text &&
                  buscaDadosEmCache['senha'] == senhaController.text) {
                var user = Usuario(
                  email: usuarioController.text,
                  senha: senhaController.text,
                  estaLogado: true,
                );
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => InicioScreen(user),
                    ),
                    (Route<dynamic> route) => false);
              } else {
                CoolAlert.show(
                  context: context,
                  title: 'Erro',
                  text: 'Dados Invalido',
                  type: CoolAlertType.error,
                );
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: Text(
              'Continuar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

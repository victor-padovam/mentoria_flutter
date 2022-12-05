import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mentoria_flutter/controller/coleta_controller.dart';
import 'package:mentoria_flutter/views/inicio.dart';

class FormColeta extends StatefulWidget {
  @override
  _FormColetaState createState() => _FormColetaState();
}

class _FormColetaState extends State<FormColeta> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  ColetaController coletaController = ColetaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Nova Coleta',
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
                          controller: alturaController,
                          validator: coletaController.validaCampos,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 5.0),
                            labelText: 'Altura',
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
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          validator: coletaController.validaCampos,
                          controller: pesoController,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 5.0),
                            labelText: 'Peso (KG)',
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: InkWell(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              double valorImc = coletaController.calculoIMC(
                alturaController.text,
                pesoController.text,
              );

              String retorno = coletaController.resultadoImc(
                valorImc,
              );

              CoolAlert.show(
                context: context,
                title: 'Sucesso',
                text: 'Resultado Calculo:' + retorno,
                type: CoolAlertType.success,
                onConfirmBtnTap: () async {
                  bool saveBox = await coletaController.salvarNoHiveColeta(
                    alturaController.text,
                    pesoController.text,
                    valorImc,
                    retorno,
                  );

                  if (saveBox) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => InicioScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  }
                },
              );
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

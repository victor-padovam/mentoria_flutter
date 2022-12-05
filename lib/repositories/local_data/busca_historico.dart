import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mentoria_flutter/models/coleta.dart';
import 'package:mentoria_flutter/views/historico/lista_historico.dart';

import '../../shared/progress.dart';

class BuscaHitorico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Coleta>>(
        future: buscaDadosDoHiveColeta(),
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
                return ListaHistorico(snapshot.data);
              }
          }
          return Progress(mensagem: 'Carregando');
        },
      ),
    );
  }

  Future<List<Coleta>> buscaDadosDoHiveColeta() async {
    var abrirBoxColeta = await Hive.openBox<Coleta>('coleta');
    List<Coleta> listaTodosDadosDaBox = abrirBoxColeta.values.toList();

    return listaTodosDadosDaBox;
  }
}

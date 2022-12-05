import 'package:flutter/material.dart';
import 'package:mentoria_flutter/models/coleta.dart';

class ListaHistorico extends StatelessWidget {
  final List<Coleta>? listaColeta;
  ListaHistorico(this.listaColeta);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
        title: const Text(
          "Historico",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaColeta!.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey[300]!,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                       trailing:
                      title: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Resultado: ' + listaColeta![index].retorno!,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Peso: ' + listaColeta![index].peso!,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Altura: ' + listaColeta![index].altura!,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'IMC: ' +
                                  listaColeta![index].valorImc!.toString(),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

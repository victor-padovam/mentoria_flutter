import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mentoria_flutter/models/coleta.dart';

class ListaHistorico extends StatefulWidget {
  final List<Coleta>? listaColeta;
  ListaHistorico(this.listaColeta);

  @override
  State<ListaHistorico> createState() => _ListaHistoricoState();
}

class _ListaHistoricoState extends State<ListaHistorico> {
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
            child: widget.listaColeta!.length == 0
                ? Center(child: Text('Nenhum registro cadastrado'))
                : ListView.builder(
                    itemCount: widget.listaColeta!.length,
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
                            title: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Resultado: ' +
                                        widget.listaColeta![index].retorno!,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Peso: ' + widget.listaColeta![index].peso!,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Altura: ' +
                                        widget.listaColeta![index].altura!,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'IMC: ' +
                                        widget.listaColeta![index].valorImc!
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: OutlinedButton(
                              onPressed: () {
                                deletaRegistroDoHive(
                                  widget.listaColeta![index].key,
                                  index,
                                );
                              },
                              child: Icon(
                                Icons.delete_forever,
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

  deletaRegistroDoHive(var key, index) async {
    final getBoxHive = await Hive.openBox<Coleta>('coleta');
    getBoxHive.delete(key).whenComplete(() {
      setState(() {
        widget.listaColeta!.removeAt(index);
      });
    });
  }
}

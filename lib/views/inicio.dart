import 'package:flutter/material.dart';

import '../shared/layout_dos_card.dart';
import 'coleta/form_coleta.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
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

import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String? mensagem;

  const Progress({this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(
            mensagem!,
          )
        ],
      ),
    );
  }
}

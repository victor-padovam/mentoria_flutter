  import 'package:flutter/material.dart';

Container layoutDosCard(String titulo, IconData icone) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.indigo[400],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icone,
            size: 70,
            color: Colors.white,
          ),
          Text(
            titulo,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
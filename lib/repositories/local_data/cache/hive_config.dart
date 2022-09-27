import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mentoria_flutter/models/coleta.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    print('inicializando hive em:' + dir.path);
    await Hive.initFlutter();
  }

   static registerAdapter() async {
    Hive.registerAdapter(ColetaAdapter());
    await Hive.openBox<Coleta>('coleta');
  }
}
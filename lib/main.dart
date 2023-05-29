import 'package:flutter/material.dart';
import 'package:mentoria_flutter/repositories/local_data/busca_login.dart';
import 'package:mentoria_flutter/repositories/local_data/cache/hive_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  await HiveConfig.registerAdapter();
  runApp(const MentoriaFlutter());
}

class MentoriaFlutter extends StatelessWidget {
  const MentoriaFlutter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BuscaLogin(),
    );
  }
}
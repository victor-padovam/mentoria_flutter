import 'package:hive_flutter/adapters.dart';

part 'coleta.g.dart';

@HiveType(typeId: 1)
class Coleta extends HiveObject {
  @HiveField(0)
  String? altura;

  @HiveField(1)
  String? peso;

  @HiveField(3)
  double? valorImc;

  @HiveField(4)
  String? retorno;

  Coleta({
    this.altura,
    this.peso,
    this.valorImc,
    this.retorno,
  });
}

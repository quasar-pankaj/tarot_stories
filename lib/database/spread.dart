// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'entity.dart';

part 'spread.g.dart';

@HiveType(typeId: 1)
class Spread extends HiveObject implements Entity{
  @override
  @HiveField(0)
  String name;

  @HiveField(1)
  List<String> cards;

  @HiveField(2)
  List<String> readings;

  Spread({
    required this.name,
    required this.cards,
    required this.readings,
  });
}

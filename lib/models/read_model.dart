import 'package:hive/hive.dart';

part 'read_model.g.dart';

@HiveType(typeId: 0)
class ReadModel extends HiveObject{

  @HiveField(0)
  final String titleRead;
  @HiveField(1)
   String chapterRead;
  @HiveField(2)
   String noteRead;
  @HiveField(3)
  int color;
  @HiveField(4)
  late String status;
  @HiveField(5)
  late int statusColor;
  @HiveField(6)
  bool isFavorite;

  ReadModel({
    required this.titleRead,
    required this.chapterRead,
    required this.noteRead,
    required this.color,
    required this.status,
    required this.statusColor,
    required this.isFavorite,
  });
}
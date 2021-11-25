import 'package:hive/hive.dart';
import 'package:kanban_app/constants/constants.dart';

part 'kanban_data.g.dart';

@HiveType(typeId: Constants.typeIdKanban)
class LocalKanban extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? row;
  @HiveField(2)
  final int? seqNum;
  @HiveField(3)
  final String? text;

  LocalKanban({
    this.id,
    this.row,
    this.seqNum,
    this.text,
  });
}


import 'package:kanban_app/local_dto/kanban/kanban_data.dart';

extension KanbanConverters on LocalKanban {
  LocalKanban fromJson(dynamic data) {
    return LocalKanban(
      id: data[_Fields.id],
      row: data[_Fields.row],
      seqNum: data[_Fields.seqNum],
      text: data[_Fields.text],
    );
  }
}

abstract class _Fields {
  static const String id = 'id';
  static const String row = 'row';
  static const String seqNum = 'seq_num';
  static const String text = 'text';
}

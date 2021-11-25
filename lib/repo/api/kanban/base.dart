

import 'package:kanban_app/dto/error.dart';
import 'package:kanban_app/local_dto/kanban/kanban_data.dart';

abstract class BaseRepoKanban {
  Future<ResultRepoKanban> getKanbans({String? row});
}

class ResultRepoKanban {
  final AppError? error;
  final List<LocalKanban>? kanbans;

  ResultRepoKanban({
    this.error,
    this.kanbans,
  });

  @override
  String toString() {
    return 'ResultRepoAuth{error: $error, kanbans: $kanbans}';
  }
}

import 'package:dio/dio.dart';
import 'package:kanban_app/constants/app_logger.dart';
import 'package:kanban_app/dto/error.dart';
import 'package:kanban_app/local_dto/kanban/kanban_data.dart';
import 'package:kanban_app/repo/api/_converters/kanban.dart';
import 'package:kanban_app/repo/api/api.dart';

import 'base.dart';
part 'parts/get_kanbans.dart';

class RepoKanban extends BaseRepoKanban {
  RepoKanban({required this.api});

  final Api api;

  @override
  Future<ResultRepoKanban> getKanbans({String? row}) async {
    return _getKanbans(
      api,
      row,
    );
  }
}


abstract class _Fields {
  static const String row = 'row';
}



import 'package:kanban_app/dto/error.dart';
import 'package:kanban_app/local_dto/kanban/kanban_data.dart';

abstract class BaseCacheManagerKanban {
  Future<void> init();

  void registerAdapters();

  Future<ResultRepoCacheManagerKanban> addItems(List<LocalKanban> item);

  Future<ResultRepoCacheManagerKanban> getItems();


  Future<ResultRepoCacheManagerKanban> removeItem();
}

class ResultRepoCacheManagerKanban {
  final AppError? error;
  final List<LocalKanban>? data;

  ResultRepoCacheManagerKanban({
    this.error,
    this.data,
  });

  @override
  String toString() {
    return 'ResultRepoCacheManagerKanban{error: $error, data: $data}';
  }
}

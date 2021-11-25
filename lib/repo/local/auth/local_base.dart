

import 'package:kanban_app/dto/error.dart';
import 'package:kanban_app/local_dto/auth/auth_data.dart';

abstract class BaseCacheManagerHive {
  Future<void> init();

  void registerAdapters();

  Future<ResultRepoCacheManager> addItem(AuthData item);

  Future<ResultRepoCacheManager> getItem();

  Future<ResultRepoCacheManager> putItem(AuthData item);

  Future<ResultRepoCacheManager> removeItem();
  Future<ResultRepoCacheManager> close();
}

class ResultRepoCacheManager {
  final AppError? error;
  final AuthData? data;

  ResultRepoCacheManager({
    this.error,
    this.data,
  });

  @override
  String toString() {
    return 'ResultRepoCacheManager{error: $error, data: $data}';
  }
}

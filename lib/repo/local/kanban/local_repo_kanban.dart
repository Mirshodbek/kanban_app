import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_app/constants/app_logger.dart';
import 'package:kanban_app/constants/constants.dart';
import 'package:kanban_app/dto/error.dart';
import 'package:kanban_app/local_dto/kanban/kanban_data.dart';

import 'local_base.dart';

class RepoCacheManagerKanban extends BaseCacheManagerKanban {
  final String keyBox;

  RepoCacheManagerKanban(this.keyBox);

  Box<LocalKanban>? _box;

  @override
  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<LocalKanban>(keyBox);
    }
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(Constants.typeIdKanban)) {
      Hive.registerAdapter(LocalKanbanAdapter());
    }
  }

  @override
  Future<ResultRepoCacheManagerKanban> addItems(List<LocalKanban> item) async {
    try {
      await init();
      await _box?.addAll(item);
      return ResultRepoCacheManagerKanban();
    } catch (error) {
      AppLogger.log(error);
      return ResultRepoCacheManagerKanban(
        error: AppError(message: 'error item save'),
      );
    }
  }

  @override
  Future<ResultRepoCacheManagerKanban> getItems() async {
    try {
      await init();
      return ResultRepoCacheManagerKanban(
        data: _box?.values.toList(),
      );
    } catch (error) {
      AppLogger.log(error);
      return ResultRepoCacheManagerKanban(
        error: AppError(message: 'error cache'),
      );
    }
  }

  @override
  Future<ResultRepoCacheManagerKanban> removeItem() async {
    try {
      await init();
      await _box?.clear();
      return ResultRepoCacheManagerKanban();
    } catch (error) {
      AppLogger.log(error);
      return ResultRepoCacheManagerKanban(
        error: AppError(message: 'error item save'),
      );
    }
  }
}

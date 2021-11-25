import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_app/constants/app_logger.dart';
import 'package:kanban_app/constants/constants.dart';
import 'package:kanban_app/dto/error.dart';
import 'package:kanban_app/local_dto/auth/auth_data.dart';
import 'package:kanban_app/repo/local/auth/local_base.dart';

class RepoCacheManagerHive extends BaseCacheManagerHive {
  final String keyBox;

  RepoCacheManagerHive(this.keyBox);

  Box<AuthData>? _box;

  @override
  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<AuthData>(keyBox);
    }
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(Constants.typeIdAuthData)) {
      Hive.registerAdapter(AuthDataAdapter());
    }
  }

  @override
  Future<ResultRepoCacheManager> addItem(AuthData item) async {
    try {
      await init();
      await _box?.add(item);
      return ResultRepoCacheManager();
    } catch (error) {
      AppLogger.log(error);
      return ResultRepoCacheManager(
        error: AppError(message: 'error item save'),
      );
    }
  }

  @override
  Future<ResultRepoCacheManager> getItem() async {
    try {
      await init();
      return ResultRepoCacheManager(
        data: _box?.values.first,
      );
    } catch (error) {
      AppLogger.log(error);
      return ResultRepoCacheManager(
        error: AppError(message: 'error cache'),
      );
    }
  }

  @override
  Future<ResultRepoCacheManager> putItem(AuthData item) async {
    try {
      await init();
      await _box?.putAt(0, item);
      return ResultRepoCacheManager();
    } catch (error) {
      AppLogger.log(error);
      return ResultRepoCacheManager(
        error: AppError(message: 'error item save'),
      );
    }
  }

  @override
  Future<ResultRepoCacheManager> removeItem() async {
    try {
      await init();
      await _box?.clear();
      return ResultRepoCacheManager();
    } catch (error) {
      AppLogger.log(error);
      return ResultRepoCacheManager(
        error: AppError(message: 'error item save'),
      );
    }
  }

  @override
  Future<ResultRepoCacheManager> close() async{
    try {
      await init();
      await _box?.close();
      return ResultRepoCacheManager();
    } catch (error) {
      AppLogger.log(error);
      return ResultRepoCacheManager(
        error: AppError(message: 'error item save'),
      );
    }
  }
}

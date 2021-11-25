part of '../repo_kanban.dart';

Future<ResultRepoKanban> _getKanbans(
  Api api,
  String? row,
) async {
  try {
    final result = await api.dio.get(
      '/cards/',
      queryParameters: {
        _Fields.row: row,
      },
    );
    final jsonList = result.data ?? [];
    final kanbans = jsonList
        .map<LocalKanban>(
      LocalKanban().fromJson,
        )
        .toList();
    return ResultRepoKanban(
      kanbans: kanbans,
    );
  } catch (error) {
    AppLogger.log(error);
    AppError? appError;
    if (error is DioError) {
      appError = AppError(
        message: error.response?.data?['detail'],
        code: error.response?.statusCode,
      );
    }
    return ResultRepoKanban(
      error: appError ??
          AppError(
            message: 'error general',
          ),
    );
  }
}

part of '../repo_auth.dart';

Future<ResultRepoAuth> _refreshToken(
  Api api,
  String oldToken,
) async {
  try {
    final result = await api.dio.post(
      '/users/refresh_token/',
      data: {
        _Fields.token: oldToken,
      },
    );
    final token = result.data[_Fields.token];
    if (token == null) {
      AppLogger.log('Error in login: token is null');
      return ResultRepoAuth(
        error: AppError(message: 'error in receive token'),
      );
    }
    return ResultRepoAuth(
      token: token,
    );
  } catch (error) {
    AppLogger.log(error);
    AppError? appError;
    if (error is DioError) {
      appError = AppError(
        message: error.response?.data?['non_field_errors']?[0],
      );
    }
    return ResultRepoAuth(
      error: appError ??
          AppError(
            message: 'error general',
          ),
    );
  }
}

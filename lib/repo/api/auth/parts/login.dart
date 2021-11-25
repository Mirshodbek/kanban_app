part of '../repo_auth.dart';

Future<ResultRepoAuth> _login(
  Api api,
  String username,
  String password,
) async {
  try {
    final result = await api.dio.post(
      '/users/login/',
      data: {
        _Fields.username: username,
        _Fields.password: password,
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
          message: error.response?.data?['errors']?[_Fields.username]?[0] ??
              error.response?.data?['errors']?[_Fields.password]?[0]);
    }
    return ResultRepoAuth(
      error: appError ??
          AppError(
            message: 'error general',
          ),
    );
  }
}

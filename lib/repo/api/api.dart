import 'package:dio/dio.dart';
import 'package:kanban_app/features/login/bloc/auth/bloc_auth.dart';

class Api {
  BlocAuth? blocAuth;
  late final dio = Dio(options)
    ..interceptors.addAll(
      [
        _BasicInterceptor(
          blocAuth: blocAuth,
        )
      ],
    );

  final options = BaseOptions(
    baseUrl: 'https://trello.backend.tests.nekidaem.ru/api/v1',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
}

class _BasicInterceptor implements Interceptor {
  _BasicInterceptor({
    this.blocAuth,
  });

  BlocAuth? blocAuth;

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.contentType = 'application/json; charset=utf-8';
    options.headers = {
      'Content-Type': 'application/json',
      "Authorization": "JWT $token",
    };
    handler.next(options);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  String? get token => blocAuth?.token;
}

extension DioErrorUtils on Object {
  String get dioErrorMessage {
    var output = 'error';
    if (this is! DioError) return output;
    final error = this as DioError;
    if (error.response?.statusCode == 422) {
      final Map? errorsMap = error.response?.data['errors'];
      if (errorsMap == null) return output;
      for (var item in errorsMap.values) {
        for (var e in item) {
          output = e;
        }
      }
    }
    return output;
  }

  int? get dioErrorStatusCode {
    int? output;
    if (this is! DioError) return output;
    return (this as DioError).response?.statusCode;
  }
}

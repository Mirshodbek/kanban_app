import 'package:dio/dio.dart';
import 'package:kanban_app/constants/app_logger.dart';
import 'package:kanban_app/dto/error.dart';
import 'package:kanban_app/repo/api/api.dart';

import 'base.dart';

part 'parts/login.dart';

part 'parts/refresh_token.dart';

class RepoAuth implements BaseRepoAuth {
  RepoAuth({required this.api});

  final Api api;

  @override
  Future<ResultRepoAuth> login(String username, String password) {
    return _login(
      api,
      username,
      password,
    );
  }

  @override
  Future<ResultRepoAuth> refreshToken(String token) {
    return _refreshToken(api, token);
  }
}

abstract class _Fields {
  static const String username = 'username';
  static const String password = 'password';
  static const String token = 'token';
}

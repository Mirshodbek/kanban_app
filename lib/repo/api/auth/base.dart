import 'package:kanban_app/dto/error.dart';

abstract class BaseRepoAuth {
  Future<ResultRepoAuth> login(
    String username,
    String password,
  );

  Future<ResultRepoAuth> refreshToken(
    String token,
  );
}

class ResultRepoAuth {
  final AppError? error;
  final String? token;

  ResultRepoAuth({
    this.error,
    this.token,
  });

  @override
  String toString() {
    return 'ResultRepoAuth{error: $error, token: $token}';
  }
}

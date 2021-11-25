part of 'bloc_auth.dart';

abstract class EventBlocAuth {}

class EventAuthInit extends EventBlocAuth {}

class EventAuthLogout extends EventBlocAuth {}
class EventAuthRefreshToken extends EventBlocAuth {}

class EventAuthLogin extends EventBlocAuth {
  EventAuthLogin({
    required this.username,
    required this.password,
  });

  final String password;
  final String username;

  @override
  String toString() =>
      'EventAuthLogin(username: $username, password: $password)';
}

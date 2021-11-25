part of 'bloc_auth.dart';

abstract class StateBlocAuth {}

class StateAuthInitial extends StateBlocAuth {}

class StateAuthLoading extends StateBlocAuth {}

class StateAuthLogin extends StateBlocAuth {
  final String? error;

  StateAuthLogin({
    this.error,
  });
}

class StateAuthAuthorized extends StateBlocAuth {
  StateAuthAuthorized({
    required this.token,
  });

  final String token;
}

class StateAuthError extends StateBlocAuth implements AppError {
  StateAuthError(this.message, {this.code});

  @override
  int? code;

  @override
  String message;
}

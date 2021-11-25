part of 'bloc_auth.dart';

extension BlocAuthUtils on BlocAuth {
  String get token {
    if (state is StateAuthAuthorized) {
      return (state as StateAuthAuthorized).token;
    }
    return '';
  }
}

part of 'bloc_auth.dart';

extension BlocAuthUtils on BlocAuth {
  String get token {
    print('asd');
    if (state is StateAuthAuthorized) {
      print('$state');

      return (state as StateAuthAuthorized).token;
    }
    return 'salom';
  }
}

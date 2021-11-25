part of '../bloc_auth.dart';

extension Login on BlocAuth {
  Future<void> _login(
    EventAuthLogin event,
    Emitter<StateBlocAuth> emit,
  ) async {
    emit(StateAuthLoading());
    final result = await repoAuth.login(
      event.username,
      event.password,
    );
    if (result.error != null) {
      emit(
        StateAuthError(
          result.error?.message ?? 'error',
        ),
      );
      return;
    }

    await repoCacheAuth.addItem(
      AuthData(
        username: event.username,
        password: event.password,
        token: result.token,
      ),
    );

    emit(
      StateAuthAuthorized(
        token: result.token ?? '',
      ),
    );
    return;
  }
}

part of '../bloc_auth.dart';

extension Logout on BlocAuth {
  Future<void> _logout(
    EventAuthLogout event,
    Emitter<StateBlocAuth> emit,
  ) async {
    emit(StateAuthLoading());
    await repoCacheAuth.removeItem();
    emit(StateAuthLogin());
    return;
  }
}

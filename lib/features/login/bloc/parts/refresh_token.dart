part of '../bloc_auth.dart';

extension RefreshToken on BlocAuth {
  Future<void> _refreshToken(
    EventAuthRefreshToken event,
    Emitter<StateBlocAuth> emit,
  ) async {
    emit(StateAuthLoading());
    final cache = await repoCacheAuth.getItem();
    final result = await repoAuth.refreshToken(
      cache.data!.token!,
    );
    if (result.token != null) {
      emit(StateAuthAuthorized(token: result.token!));
      return;
    }
  }
}

part of '../bloc_auth.dart';

extension Init on BlocAuth {
  Future<void> _init(
    event,
    Emitter<StateBlocAuth> emit,
  ) async {
    api.blocAuth = this;
    emit(StateAuthLoading());
    final cache = await repoCacheAuth.getItem();
    if (cache.data != null) {
      emit(StateAuthAuthorized(token: cache.data!.token!));
      return;
    } else {
      emit(
        StateAuthLogin(
          error: '${cache.error?.message}',
        ),
      );
      return;
    }
  }
}

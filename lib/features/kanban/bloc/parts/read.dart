part of '../bloc_kanban.dart';

extension Read on BlocKanban {
  Future<void> _read(
    EventReadKanban event,
    Emitter<StateBlocKanban> emit,
  ) async {
    emit(StateKanbanLoading());
    final kanbans = await cacheRepo.getItems();
    if (kanbans.data == null||kanbans.data!.isEmpty) {
      final result = await repo.getKanbans();
      if (result.error != null) {
        emit(
          StateKanbanError(
            result.error?.message ?? 'error',
          ),
        );
        return;
      }

      await cacheRepo.addItems(result.kanbans ?? []);

      emit(
        StateKanbanInitial(
          result.kanbans ?? [],
        ),
      );
      return;
    } else {
      emit(
        StateKanbanInitial(
          kanbans.data ?? [],
        ),
      );
    }
  }
}

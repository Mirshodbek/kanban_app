part of 'bloc_kanban.dart';

abstract class StateBlocKanban {}

class StateKanbanInitial extends StateBlocKanban {
  final List<LocalKanban> kanbans;

  StateKanbanInitial(this.kanbans);
}

class StateKanbanLoading extends StateBlocKanban {}
class StateKanbanErrorToken extends StateBlocKanban {}

class StateKanbanError extends StateBlocKanban implements AppError {
  StateKanbanError(this.message, {this.code});

  @override
  int? code;

  @override
  String message;
}

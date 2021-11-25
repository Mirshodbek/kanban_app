import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/dto/error.dart';
import 'package:kanban_app/local_dto/kanban/kanban_data.dart';
import 'package:kanban_app/repo/api/kanban/repo_kanban.dart';
import 'package:kanban_app/repo/local/kanban/local_repo_kanban.dart';
part 'events.dart';

part 'states.dart';
part 'parts/read.dart';

class BlocKanban extends Bloc<EventBlocKanban, StateBlocKanban> {
  BlocKanban({
    required this.repo,
    required this.cacheRepo,
}) : super(StateKanbanLoading()) {
    on<EventReadKanban>(_read);
  }

  final RepoKanban repo;
  final RepoCacheManagerKanban cacheRepo;
}

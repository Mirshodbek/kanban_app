import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/dto/error.dart';
import 'package:kanban_app/features/kanban/bloc/bloc_kanban.dart';
import 'package:kanban_app/local_dto/auth/auth_data.dart';
import 'package:kanban_app/repo/api/api.dart';
import 'package:kanban_app/repo/api/auth/repo_auth.dart';
import 'package:kanban_app/repo/local/auth/local_repo_auth.dart';

part 'event.dart';

part 'state.dart';

part 'extensions.dart';

part 'parts/init.dart';

part 'parts/login.dart';

part 'parts/logout.dart';

part 'parts/refresh_token.dart';

class BlocAuth extends Bloc<EventBlocAuth, StateBlocAuth> {
  BlocAuth({
    required BuildContext context,
  }) : super(StateAuthInitial()) {
    on<EventAuthInit>(_init);
    on<EventAuthLogin>(_login);
    on<EventAuthLogout>(_logout);
    on<EventAuthRefreshToken>(_refreshToken);
    repoCacheAuth = RepositoryProvider.of<RepoCacheManagerHive>(context);
    repoAuth = RepositoryProvider.of<RepoAuth>(context);
    api = RepositoryProvider.of<Api>(context);
    blocKanban = BlocProvider.of<BlocKanban>(context);
  }

  late final RepoAuth repoAuth;
  late final RepoCacheManagerHive repoCacheAuth;
  late final Api api;
  late final BlocKanban blocKanban;
}

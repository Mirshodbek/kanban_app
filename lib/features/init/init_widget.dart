import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/features/kanban/bloc/bloc_kanban.dart';
import 'package:kanban_app/features/login/bloc/bloc_auth.dart';
import 'package:kanban_app/repo/api/api.dart';
import 'package:kanban_app/repo/api/auth/repo_auth.dart';
import 'package:kanban_app/repo/api/kanban/repo_kanban.dart';
import 'package:kanban_app/repo/local/auth/local_repo_auth.dart';
import 'package:kanban_app/repo/local/kanban/local_repo_kanban.dart';

class InitWidget extends StatelessWidget {
  final Widget child;

  InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final api = Api();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: api,
        ),
        RepositoryProvider(
          create: (context) => RepoCacheManagerHive(
            'authorization',
          ),
        ),
        RepositoryProvider(
          create: (context) => RepoCacheManagerKanban(
            'kanban',
          ),
        ),
        RepositoryProvider(
          create: (context) => RepoAuth(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        RepositoryProvider(
          create: (context) => RepoKanban(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BlocKanban(
                  repo: RepositoryProvider.of<RepoKanban>(context),
                  cacheRepo: RepositoryProvider.of<RepoCacheManagerKanban>(context),
                ),
              ),
              BlocProvider(
                create: (context) => BlocAuth(
                  context: context,
                )..add(EventAuthInit()),
              ),
            ],
            child: Builder(
              builder: (context) {
                return child;
              },
            ),
          );
        },
      ),
    );
  }
}

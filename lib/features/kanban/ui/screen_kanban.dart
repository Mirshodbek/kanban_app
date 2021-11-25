import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/constants/constants.dart';
import 'package:kanban_app/features/kanban/bloc/bloc_kanban.dart';
import 'package:kanban_app/features/login/bloc/auth/bloc_auth.dart';
import 'package:kanban_app/features/login/ui/screen_login.dart';
import 'package:kanban_app/local_dto/kanban/kanban_data.dart';
import 'package:kanban_app/repo/local/kanban/local_repo_kanban.dart';
import 'package:kanban_app/widgets/app_loader.dart';

part 'rows/approved.dart';

part 'rows/in_progress.dart';

part 'rows/needs_review.dart';

part 'rows/on_hold.dart';

class ScreenKanban extends StatelessWidget {
  const ScreenKanban({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocAuth, StateBlocAuth>(
      listener: (context, state) {
        if (state is StateAuthLogin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const ScreenLogin(),
            ),
          );
        }
      },
      child: BlocProvider.value(
        value: BlocProvider.of<BlocKanban>(context)..add(EventReadKanban()),
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text('On Hold'),
                  ),
                  Tab(
                    child: Text('In Progress'),
                  ),
                  Tab(
                    child: Text('Needs Review'),
                  ),
                  Tab(
                    child: Text('Approved'),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<BlocAuth>().add(EventAuthLogout());
                    RepositoryProvider.of<RepoCacheManagerKanban>(context)
                        .removeItem();
                  },
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                  ),
                ),
              ],
            ),
            body: AppLoaderOverlay(
              child: BlocConsumer<BlocKanban, StateBlocKanban>(
                listener: (context, state) {
                  if (state is StateKanbanLoading) {
                    context.loaderOverlay.show();
                  } else {
                    context.loaderOverlay.hide();
                  }
                  if (state is StateKanbanErrorToken) {
                    context.read<BlocAuth>().add(EventAuthRefreshToken());
                  }
                },
                builder: (context, state) {
                  if (state is StateKanbanInitial) {
                    return TabBarView(
                      children: [
                        _OnHold(
                          kanbans: state.kanbans
                              .where((e) => e.row == Constants.rowOnHold)
                              .toList(),
                        ),
                        _InProgress(
                          kanbans: state.kanbans
                              .where((e) => e.row == Constants.rowInProgress)
                              .toList(),
                        ),
                        _NeedsReview(
                          kanbans: state.kanbans
                              .where((e) => e.row == Constants.rowNeedsReview)
                              .toList(),
                        ),
                        _Approved(
                          kanbans: state.kanbans
                              .where((e) => e.row == Constants.rowApproved)
                              .toList(),
                        ),
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

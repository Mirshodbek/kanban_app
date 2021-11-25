import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/features/kanban/ui/screen_kanban.dart';
import 'package:kanban_app/features/login/bloc/auth/bloc_auth.dart';
import 'package:kanban_app/features/login/ui/screen_login.dart';
import 'package:kanban_app/widgets/app_loading_indicator.dart';
class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ColoredBox(
        color: Colors.black12,
        child: BlocListener<BlocAuth, StateBlocAuth>(
          listener: (context, state) {
            if (state is StateAuthLogin) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ScreenLogin(),
                ),
              );
            }
            if (state is StateAuthAuthorized) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ScreenKanban(),
                ),
              );
            }

          },
          child: const AppLoadingIndicator.inverted(),
        ),
      ),
    );
  }
}

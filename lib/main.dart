import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_app/l10n/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/init/init_widget.dart';
import 'features/splash/screen_splash.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(
    InitWidget(
      key: const ValueKey('init'),
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Trello App',
        theme: ThemeData.dark(),
        home: const ScreenSplash(),
      ),
    ),
  );
}

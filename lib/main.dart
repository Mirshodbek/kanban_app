import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
        title: 'Trello App',
        theme: ThemeData.dark(),
        home: const ScreenSplash(),
      ),
    ),
  );
}

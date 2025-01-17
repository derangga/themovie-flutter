import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:themovie_flutter/src/di/injection.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';

import 'src/app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: ColorTheme.primary),
  );
  setupLogger();
  await dotenv.load(fileName: ".env");
  Injection.setup();
  runApp(MyApp());
}

void setupLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

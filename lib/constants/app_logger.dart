import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AppLogger {
  factory AppLogger() => _instance;

  AppLogger._();

  static final _instance = AppLogger._();
  static final logger = Logger();
  static final _loggerCustom = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      lineLength: 20,
    ),
  );

  static void _logDio(DioError error) {
    var output = error.message;
    if (error.response?.statusMessage != null) {
      output += ' - ${error.response?.statusMessage}';
    }
    output += '\n${error.response?.data.toString().firstLines}';
    if (error.requestOptions.method == 'get') {
      output += ' \n${error.response?.realUri}';
    } else {
      output += '\n${error.requestOptions.path}\nParameters:\n${error.requestOptions.data}';
    }
    _loggerCustom.wtf(output);
  }

  static void log(dynamic message) {
    if (message is DioError) {
      _logDio(message);
    } else {
      logger.e(message);
    }
  }

  void call(dynamic message) => log(message);
}

extension _StringUtils on String {
  String get firstLines {
    final amount = length > 350 ? 350 : length;
    return substring(0, amount);
  }
}

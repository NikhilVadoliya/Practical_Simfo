import 'package:logger/logger.dart';

enum _LoggerType { information, waring, delete, wtf, error }

class AppLogger {
  AppLogger._();

  static void wtf(String message) => _printLogger(message, _LoggerType.wtf);

  static void i(String message) => _printLogger(message, _LoggerType.information);

  static void w(String message) => _printLogger(message, _LoggerType.waring);

  static void d(String message) => _printLogger(message, _LoggerType.delete);

  static void e(String message) => _printLogger(message, _LoggerType.delete);

  static void _printLogger(String message, _LoggerType loggerType) {
    switch (loggerType) {
      case _LoggerType.information:
        Logger().i(message);
        break;
      case _LoggerType.waring:
        Logger().w(message);
        break;
      case _LoggerType.delete:
        Logger().d(message);
        break;
      case _LoggerType.wtf:
        Logger().wtf(message);
        break;
      case _LoggerType.error:
        Logger().e(message);
        break;
    }
  }
}

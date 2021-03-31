import 'dart:developer' as dev;

import 'package:ansicolor/ansicolor.dart';
import 'package:logx/logx.dart';
import 'package:logx/src/level.dart';

final _greyPen = AnsiPen()..xterm(243, bg: false);
final _bluePen = AnsiPen()..blue(bg: false, bold: true);
final _redPen = AnsiPen()..red(bg: false, bold: true);
final _yellowPen = AnsiPen()..yellow(bg: false, bold: true);

/// [Log] exports static logging methods you can call from your app.
///
/// To customize default `name` param see [Logger] class that you can
/// instantiate with custom parameters.
class Log {
  Log._();

  /// Do disable colored prints set this value to false in your main function.
  ///
  /// ```dart
  /// void main() {
  ///   Log.colorsEnabled = false;
  /// }
  /// ```
  static bool colorsEnabled = true;

  /// Set minimum log level to be logged. For example, setting this
  /// to [LogLevel.info] means that all INFO, WARNING, and ERROR logs are
  /// printed, but DEBUG logs are left out.
  static LogLevel minLogLevel = LogLevel.debug;

  /// [onLog] is called whenever any of the static log methods are invoked.
  /// Override [onLog] if you need custom behavior for your logs.
  static void Function(
    LogLevel level, {
    Object? message,
    String? name,
    Object? error,
    StackTrace? stackTrace,
    String? help,
  }) onLog = (
    LogLevel level, {
    Object? message,
    String? name,
    Object? error,
    StackTrace? stackTrace,
    String? help,
  }) {
    if (minLogLevel.severity > level.severity) return;

    final _name = name ?? level.value;
    final result = colorsEnabled
        ? level.when(
            debug: () => _greyPen('[$_name]'),
            info: () => _bluePen('[$_name]'),
            warning: () => _yellowPen('[$_name]'),
            error: () => _redPen('[$_name]'),
          )
        : '[$_name]';

    dev.log(
      result!,
      name: _name,
      error: error,
      stackTrace: stackTrace,
    );
  };

  /// Debug prints can be disabled by settings [minLogLevel] to [LogLevel.info].
  static void debug(Object? message, {String? name}) {
    onLog(LogLevel.debug, message: message, name: name);
  }

  /// Normal logs.
  static void info(Object? message, {String? name}) {
    onLog(LogLevel.info, message: message, name: name);
  }

  /// Important logs that should be visible.
  static void warning(Object? message, {String? name}) {
    onLog(LogLevel.warning, message: message, name: name);
  }

  /// Most important log level.
  ///
  /// [help] serves for user-visible help to fix given error.
  static void error(
    Object? message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
    String? help,
  }) {
    onLog(
      LogLevel.error,
      message: message,
      name: name,
      error: error,
      stackTrace: stackTrace,
      help: help,
    );
  }
}

class Logger {
  Logger(
    this.name, {
    this.colorsEnabled = true,
    this.minLogLevel = LogLevel.debug,
    void Function(LogLevel level,
            {Object? message,
            String? name,
            Object? error,
            StackTrace? stackTrace,
            String? help})?
        onLog,
  }) {
    if (onLog != null) {
      this.onLog = onLog;
    }
  }

  final String name;

  /// To disable colored prints set this value to false in your main function.
  ///
  /// ```dart
  /// void main() {
  ///   Log.colorsEnabled = false;
  /// }
  /// ```
  bool colorsEnabled = true;

  /// Set minimum log level to be logged. For example, setting this
  /// to [LogLevel.info] means that all INFO, WARNING, and ERROR logs are
  /// printed, but DEBUG logs are left out.
  LogLevel minLogLevel = LogLevel.debug;

  /// [onLog] is called whenever any of the static log methods are invoked.
  /// Override [onLog] if you need custom behavior for your logs.
  late void Function(
    LogLevel level, {
    Object? message,
    String? name,
    Object? error,
    StackTrace? stackTrace,
    String? help,
  }) onLog = (
    LogLevel level, {
    Object? message,
    String? name,
    Object? error,
    StackTrace? stackTrace,
    String? help,
  }) {
    if (minLogLevel.severity > level.severity) return;

    final _name = name ?? level.value;
    final result = colorsEnabled
        ? level.when(
            debug: () => _greyPen('[$_name]'),
            info: () => _bluePen('[$_name]'),
            warning: () => _yellowPen('[$_name]'),
            error: () => _redPen('[$_name]'),
          )
        : '[$_name]';

    print('$result $message');
    dev.log(
      '$result $message',
      name: _name,
      error: error,
      stackTrace: stackTrace,
    );
  };

  /// Debug prints can be disabled by settings [minLogLevel] to [LogLevel.info].
  void debug(Object? message, {String? name}) {
    onLog(LogLevel.debug, message: message, name: name);
  }

  /// Normal logs.
  void info(Object? message, {String? name}) {
    onLog(LogLevel.info, message: message, name: name);
  }

  /// Important logs that should be visible.
  void warning(Object? message, {String? name}) {
    onLog(LogLevel.warning, message: message, name: name);
  }

  /// Most important log level.
  ///
  /// [help] serves for user-visible help to fix given error.
  void error(
    Object? message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
    String? help,
  }) {
    onLog(
      LogLevel.error,
      message: message,
      name: name,
      error: error,
      stackTrace: stackTrace,
      help: help,
    );
  }
}

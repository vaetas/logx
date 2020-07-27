import 'dart:developer' as dev;

const _kLogName = 'log';

class Log {
  static void d(
    dynamic message, {
    String name,
    Object error,
    StackTrace stackTrace,
  }) {
    dev.log(
      message,
      name: _formatName(name ?? _kLogName),
      error: error,
      stackTrace: stackTrace,
    );
  }

  static String _formatName(Object context) {
    return context?.toString();
  }
}

class LogX {
  final Object name;

  const LogX([this.name]);

  void call(
    dynamic message, {
    String name,
    Object error,
    StackTrace stackTrace,
  }) {
    this.d(message);
  }

  void d(
    dynamic message, {
    String name,
    Object error,
    StackTrace stackTrace,
  }) {
    dev.log(
      message,
      name: _formatName(name ?? (this.name ?? _kLogName)),
      error: error,
      stackTrace: stackTrace,
    );
  }

  static String _formatName(Object context) {
    return context?.toString();
  }
}

mixin LogMixin on Object {
  LogX get log => LogX(this.runtimeType);
}

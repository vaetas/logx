import 'dart:developer' as dev;

const _kLogName = 'log';

void _logTime(
  Object message, {
  String name,
  Object error,
  StackTrace stackTrace,
}) {
  final now = DateTime.now();

  dev.log(
    '${now.toIso8601String()} | $message',
    name: name,
    error: error,
    stackTrace: stackTrace,
  );
}

class Log {
  /// Simple debug log.
  static void d(
    Object message, {
    String name,
    Object error,
    StackTrace stackTrace,
  }) {
    dev.log(
      '$message',
      name: _formatName(name ?? _kLogName),
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Debug print which adds timestamp to log.
  static void t(
    Object message, {
    String name,
    Object error,
    StackTrace stackTrace,
  }) {
    _logTime(
      '$message',
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

  /// Instance of [LogX] is callable.
  void call(
    Object message, {
    String name,
    Object error,
    StackTrace stackTrace,
  }) {
    this.d(
      '$message',
      name: name,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Simple debug output. When using mixin [name] is deduced from current class.
  void d(
    Object message, {
    String name,
    Object error,
    StackTrace stackTrace,
  }) {
    dev.log(
      '$message',
      name: _formatName(name ?? (this.name ?? _kLogName)),
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Debug print which adds timestamp to log.
  void t(
    Object message, {
    String name,
    Object error,
    StackTrace stackTrace,
  }) {
    _logTime(
      '$message',
      name: _formatName(name ?? (this.name ?? _kLogName)),
      error: error,
      stackTrace: stackTrace,
    );
  }

  static String _formatName(Object context) {
    return context?.toString();
  }
}

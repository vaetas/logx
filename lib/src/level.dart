const _kDebug = 'DEBUG';
const _kInfo = 'INFO';
const _kWarning = 'WARNING';
const _kError = 'ERROR';

class LogLevel {
  const LogLevel._(this.value, this.severity);

  final String value;
  final int severity;

  static const debug = LogLevel._(_kDebug, 0);
  static const info = LogLevel._(_kInfo, 1);
  static const warning = LogLevel._(_kWarning, 2);
  static const error = LogLevel._(_kError, 3);

  T? when<T>({
    T Function()? debug,
    T Function()? info,
    T Function()? warning,
    T Function()? error,
  }) {
    switch (value) {
      case _kDebug:
        return debug?.call();
      case _kInfo:
        return info?.call();
      case _kWarning:
        return warning?.call();
      case _kError:
        return error?.call();
    }
  }

  @override
  String toString() => 'LogLevel{$value}';
}

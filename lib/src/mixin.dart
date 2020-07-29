import 'log.dart';

/// Add [LogX] instance to any class. Log [name] is se to class type.
mixin LogMixin on Object {
  LogX get log => LogX(this.runtimeType);
}

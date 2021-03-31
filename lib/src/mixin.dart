import 'package:logx/src/log.dart';

/// Add [Logger] instance to any class. [Logger.name] is set to class type.
mixin LogMixin on Object {
  Logger get logger => Logger(runtimeType.toString());
}

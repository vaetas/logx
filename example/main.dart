// ignore_for_file: cascade_invocations

import 'dart:developer';

import 'package:logx/logx.dart';

void main() {
  log('fsfs');
  final logger = Logger('main');
  logger.debug('debug');
  logger.info('info');
  logger.warning('warning');
  logger.error('error');
  Log.info('Hello world');
}

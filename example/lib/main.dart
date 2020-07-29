import 'package:flutter/material.dart';
import 'package:logx/logx.dart';

void main() {
  Log.d('Error message from main()', error: ArgumentError());
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget with LogMixin {
  @override
  Widget build(BuildContext context) {
    log.d('Building widget');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('LogX')),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                log.t('Hello world');
              },
              child: Text('Log!'),
            ),
          ),
        ),
      ),
    );
  }
}

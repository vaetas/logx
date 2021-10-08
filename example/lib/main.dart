import 'package:flutter/material.dart';
import 'package:logx/logx.dart';

void main() {
  Log.d('Error log', error: ArgumentError(), name: 'main');
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget with LogMixin {
  @override
  Widget build(BuildContext context) {
    log.d('Building widget', error: ArgumentError());
    log.t('Log with timestamp');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('LogX')),
        body: Container(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  log('Hello world');
                },
                child: Text('Log!'),
              ),
              SomeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class SomeWidget extends StatelessWidget with LogMixin {
  @override
  Widget build(BuildContext context) {
    log.d('Build');
    return Container();
  }
}

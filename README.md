# LogX: Simple and concise logs for Flutter

LogX adds extends method `log` from `dart:developer` package to add useful features.

## Mixin

You can use `LogMixin` to instantly add log functionality to any class. This mixin provides a `LogX` instance to this class and you can use it for logging. This will automatically set runtime type of current class as a name.

```dart
class A with LogMixin {
    void hello() {
        log.d('Hello world!');

        log('This instance is callable!');
    }
}
```

## Static methods

If you cannot use `LogMixin` you can use static methods from  `Log` class. Remeber that you need to provide name by yourself, otherwise default name is used.

```dart
void main() {
    Log.d('Hello', name: 'Main');
}
```

***

**Important:** Do not import `dart:developer` together with this package. They both use `log` keyword and it might conflict.
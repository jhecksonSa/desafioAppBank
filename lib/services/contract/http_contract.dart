import 'dart:async';

abstract class HttpContract<T> {
  Future<T> fetch({List<String>? params});
}


import 'dart:async';

class EventBus {
  final _stearmController = StreamController.broadcast();

  static final EventBus instance = EventBus._internal();

  factory EventBus() => instance;

  EventBus._internal();

  void fire(event) {
    _stearmController.add(event);
  }

  //订阅事件
  StreamSubscription on<T>(void Function(T) onData) {
    return _stearmController.stream.where((event) => event is T).cast<T>().listen(onData);
  }
}
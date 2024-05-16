import 'dart:async';

class EventBus {
  final StreamController _streamController;

  StreamController get streamController => _streamController;

  EventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  EventBus.customController(StreamController controller)
      : _streamController = controller;

  Stream<T> on<T>() {
    return streamController.stream.where((event) => event is T).cast<T>();
  }

  void fire(event) {
    streamController.add(event);
  }

  void destory() {
    _streamController.close();
  }
}

import 'package:event_bus/event_bus.dart';

class KqcEventbus {
  static KqcEventbus _instance = new KqcEventbus._();
  factory KqcEventbus() => _instance;
  late EventBus _bus;
  KqcEventbus._(){
    _bus = EventBus();
  }

  static fire(dynamic event) {
    KqcEventbus()._bus.fire(event);
  }

  static Stream<T> on<T>() {
     return KqcEventbus()._bus.on<T>();
  }

}
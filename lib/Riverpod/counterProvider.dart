import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = NotifierProvider<Counterprovider, int>(
  () => Counterprovider(),
);

class Counterprovider extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increament() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
}

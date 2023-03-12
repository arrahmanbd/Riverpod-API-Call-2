import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_state/model/counter_model.dart';

class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier(super._state);
 int counter = 0;
  void increment() {
   
    counter++;
    state = state.copyWith(count: counter);
  }
}

final CounterProvider = StateNotifierProvider<CounterNotifier,CounterModel>((ref) {
  return CounterNotifier(CounterModel(0));
});

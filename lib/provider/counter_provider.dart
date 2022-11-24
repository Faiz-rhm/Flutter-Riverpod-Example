import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/Counter.dart';

// Provider
final helloWordProvider = Provider((ref) => "hello world!");
// StateProvider
final counterProvider = StateProvider((ref) => 0);

// StateNotifierProvider
class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier(): super(_initialValue);

  static final _initialValue = Counter(0);

  inCrement() {
    state = Counter(state.count + 1);
  }

  deCrement() {
    state = Counter(state.count - 1);
  }
}

final counterStateProvider = StateNotifierProvider<CounterNotifier, Counter>((ref) =>  CounterNotifier());

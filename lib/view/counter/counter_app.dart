import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/Counter.dart';
import 'package:river_pod/provider/counter_provider.dart';

class CounterApp extends ConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = double.infinity;

    final helloWorld = ref.watch(helloWordProvider);
    final counter = ref.watch(counterProvider);

    Counter counterProviders = ref.watch(counterStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Provider
            Text(helloWorld, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20,),
            // StateProvider
            Text('Counter $counter', style: const TextStyle(fontSize:20,)),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () => ref.read(counterProvider.notifier).state--,
                  child: const Text('Decrement'),
                ),
                MaterialButton(
                  onPressed: () => ref.read(counterProvider.notifier).state++,
                  child: const Text('Increment'),
                )
              ],
            ),
            // StateNotifierProvider
            Text('Counter ${counterProviders.count}', style: const TextStyle(fontSize:20,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () => ref.read(counterStateProvider.notifier).deCrement() ,
                  child: const Text('Decrement'),
                ),
                MaterialButton(
                  onPressed: () => ref.read(counterStateProvider.notifier).inCrement(),
                  child: const Text('Increment'),
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}

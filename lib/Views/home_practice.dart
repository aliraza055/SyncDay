import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncday/Riverpod/counterProvider.dart';

class HomePractice extends ConsumerWidget {
  const HomePractice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final counter = ref.read(counterProvider.notifier);

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (count > 0) {
                counter.increament();
              }
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              counter.reset();
            },
            child: const Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              counter.decrement();
            },
            child: const Icon(Icons.add),
          ),
          Switch(
            value: true,
            onChanged: (val) {
              //  ref.read(isLoading.notifier).state = val;
            },
          ),
        ],
      ),
      body: Center(child: Text('$count', style: const TextStyle(fontSize: 30))),
    );
  }
}

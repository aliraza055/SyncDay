import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

final welText = StateProvider<int>((ref) {
  return 0;
});

class HomePractice extends ConsumerWidget {
  const HomePractice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(welText.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),

      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final counter = ref.watch(welText);
            return Text(
              counter.toString(),
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
      ),
    );
  }
}

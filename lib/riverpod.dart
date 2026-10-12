import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class MyWidget extends ConsumerWidget {
  new({super.key});
  final counterProvider = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Pushed many times', style: TextStyle(fontSize: 25)),
            ),
            Consumer(
              builder: ((context, ref, child) {
                final count = ref.watch(counterProvider);
                return Text('$count', style: TextStyle(fontSize: 25));
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add, color: Colors.red),
      ),
    );
  }
}

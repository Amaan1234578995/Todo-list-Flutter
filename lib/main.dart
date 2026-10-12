import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// Todo Model
class Todo {
  final String text;
  bool status;

  Todo({required this.text, this.status = false});
}

final todoProvider = StateProvider<List<Todo>>((ref) => []);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newvalue = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        backgroundColor: const Color.fromARGB(255, 211, 69, 59),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,

                    decoration: const InputDecoration(
                      hintText: "Enter Todo",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      List<Todo> newlist = List<Todo>.from(
                        ref.read(todoProvider),
                      );

                      newlist.add(Todo(text: controller.text));
                      ref.read(todoProvider.notifier).state = newlist;
                      controller.clear();
                    }
                  },

                  icon: const Icon(Icons.add, size: 30, color: Colors.red),
                ),
              ],
            ),

            const SizedBox(height: 50),

            Expanded(
              child: ListView.builder(
                itemCount: newvalue.length,

                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(15),

                    margin: const EdgeInsets.only(bottom: 10),

                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Row(
                      children: [
                        // Checkbox
                        Checkbox(
                          value: newvalue[index].status,

                          onChanged: (value) {
                            List<Todo> newlist = List<Todo>.from(
                              ref.read(todoProvider),
                            );

                            newlist[index].status = value ?? false;

                            ref.read(todoProvider.notifier).state = newlist;
                          },
                        ),
                        Expanded(
                          child: Text(
                            newvalue[index].text,

                            style: const TextStyle(fontSize: 18),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            // Get current list
                            List<Todo> newlist = List<Todo>.from(
                              ref.read(todoProvider),
                            );
                            newlist.removeAt(index);
                            ref.read(todoProvider.notifier).state = newlist;
                          },

                          icon: const Icon(Icons.delete, size: 20),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

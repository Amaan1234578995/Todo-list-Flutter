// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: TodoScreen());
//   }
// }

// class TodoScreen extends StatelessWidget {
//   TodoScreen({super.key});

//   final valuenotifiertext = ValueNotifier('');
//   final valuenotifier = ValueNotifier(0);

//   @override
//   Widget build(BuildContext context) {
//     String todo = '';

//     return Scaffold(
//       appBar: AppBar(title: const Text('TODO')),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     onChanged: (value) {
//                       todo.value = value;
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

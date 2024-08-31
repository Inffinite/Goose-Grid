import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goosegrid/Setup.dart';

// part 'main.g.dart';

// @riverpod
// String helloWorld(HelloWorldRef ref) {
//   return 'Hello world';
// }

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Setup(),
    );
  }
}

// color pallete
// https://coolors.co/e9f5db-dcebca-cfe1b9-c2d5aa-b5c99a-a6b98b-97a97c-849669-728359-606f49

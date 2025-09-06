import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goosegrid/Pages/Home.dart';
import 'package:goosegrid/Pages/MeterNumber.dart';
import 'package:goosegrid/Pages/Setup.dart';

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
    return MaterialApp(
      title: 'Goose Grid',
      theme: ThemeData(
        primaryColor: const Color(0xff606F49),
      ),
      debugShowCheckedModeBanner: false,
      home: const Setup(),
    );
  }
}

// color pallete
// https://coolors.co/e9f5db-dcebca-cfe1b9-c2d5aa-b5c99a-a6b98b-97a97c-849669-728359-606f49

// policy https://doc-hosting.flycricket.io/goose-grid-privacy-policy/4c99a9b7-68a3-4822-9ef4-516ff5a954a8/privacy

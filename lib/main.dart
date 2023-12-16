import 'package:flutter/material.dart';
import 'package:slash/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0x00000000),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0x00000000))),
      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

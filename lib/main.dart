import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CardMatchingScreen(),
    );
  }
}

class CardMatchingScreen extends StatefulWidget {
  const CardMatchingScreen({super.key});

  @override
  State<CardMatchingScreen> createState() => _CardMatchingScreenState();
}

class _CardMatchingScreenState extends State<CardMatchingScreen> {
  @override
  Widget build(BuildContext context) {
    return const CardMatchingScreen();
  }
}
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
  List<Color> cardColors = [
    Colors.red, Colors.red, 
    Colors.green, Colors.green,
    Colors.blue, Colors.blue,
    Colors.yellow, Colors.yellow,
    Colors.purple, Colors.purple,
    Colors.orange, Colors.orange,
    Colors.pink, Colors.pink,
    Colors.teal, Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Card Matching Game', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey
      ),
      body: Padding (
        padding: EdgeInsets.all(5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30
          ),
          itemCount: 16,
          itemBuilder: (context, index) {
            return Card(
              color: cardColors[index],
            );
          }
        )
      )
    );
  }
}
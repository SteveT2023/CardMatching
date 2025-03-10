import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

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

  List<bool> flippedCards = List.filled(16, false);
  int? firstPickedCard;
  int? secondPickedCard;
  List<GlobalKey<FlipCardState>> cardID = List.generate(16, (index) => GlobalKey<FlipCardState>());

  @override
  void initState() {
    super.initState();
    cardColors.shuffle();
  }

  void flipCard(int index) {
    if (flippedCards[index]) {
      return;
    }

    cardID[index].currentState?.toggleCard();

    setState(() {
      flippedCards[index] = true;
    });

    if (firstPickedCard == null) {
      firstPickedCard = index;
    } else if (secondPickedCard == null) {
      secondPickedCard = index;
      checkMatch();
    }
  }

  void checkMatch() {
    if (cardColors[firstPickedCard!] == cardColors[secondPickedCard!]) {
      firstPickedCard = null;
      secondPickedCard = null;
      checkVictory();
    } else {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          flippedCards[firstPickedCard!] = false;
          flippedCards[secondPickedCard!] = false;
          cardID[firstPickedCard!].currentState?.toggleCard();
          cardID[secondPickedCard!].currentState?.toggleCard();
          firstPickedCard = null;
          secondPickedCard = null;
        });
      });
    }
  }

  void checkVictory() {
    if (flippedCards.every((flipped) => flipped)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Congratulations!'),
            content: Text('You Win!'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Card Matching Game', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20
          ),
          itemCount: 16,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => flipCard(index),
              child: FlipCard(
                key: cardID[index],
                flipOnTouch: false,
                direction: FlipDirection.HORIZONTAL,
                front: Card(
                  color: Colors.white,
                  child: Center(
                    child: Icon(Icons.diamond, color: Colors.black),
                  ),
                ),
                back: Card(
                  color: cardColors[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
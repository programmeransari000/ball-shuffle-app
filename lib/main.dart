import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class ColorsShuffle {
  final Color color;
  ColorsShuffle(this.color);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(title: const Text("Balls Shuffle")),
        body: const BallsShuffleScreen(),
      ),
    );
  }
}

class BallsShuffleScreen extends StatefulWidget {
  const BallsShuffleScreen({super.key});

  @override
  State<BallsShuffleScreen> createState() => _BallsShuffleScreenState();
}

class _BallsShuffleScreenState extends State<BallsShuffleScreen> {
  List<ColorsShuffle> colors = [
    ColorsShuffle(Colors.amber),
    ColorsShuffle(Colors.red),
    ColorsShuffle(Colors.deepPurple),
    ColorsShuffle(Colors.lightGreenAccent),
    ColorsShuffle(Colors.pink),
    ColorsShuffle(Colors.teal),
    ColorsShuffle(Colors.black12),
    ColorsShuffle(Colors.limeAccent),
  ];

  void colorShufle() {
    setState(() {
      colors.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < colors.length / 2; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: colors[i].color,
                      borderRadius: BorderRadius.circular(100)),
                ),
              )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = (colors.length / 2).round(); i < colors.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: colors[i].color,
                      borderRadius: BorderRadius.circular(100)),
                ),
              )
          ],
        ),
        const SizedBox(height: 40),
        InkWell(
          onTap: () => colorShufle(),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.orange,
            ),
            child: const Center(
                child: Text(
              "Shuffle",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
  }
}

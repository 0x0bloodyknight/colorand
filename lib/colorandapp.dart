import 'dart:math';

import 'package:flutter/material.dart';

class ColorandApp extends StatelessWidget {
  const ColorandApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Colorand',
      home: HomePage(title: 'Colorand home page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title, this.color}) : super(key: key);
  final String title;
  final Color? color;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.white;

  @override
  void initState() {
    super.initState();
    _color = widget.color ?? _color;
  }

  Color _getRandomColor() {
    final _random = Random();

    const _max = 0xFFFFFF + 1; // 0xRRGGBB + 1(because nextInt is exclusive)

    return Color(_random.nextInt(_max)).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _color = _getRandomColor();
        });
      },
      child: Scaffold(
        backgroundColor: _color,
        body: const Center(
          child: Text('Hey there'),
        ),
      ),
    );
  }
}

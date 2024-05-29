import 'package:flutter/material.dart';
import 'dart:async';

class Exp3 extends StatefulWidget {
  @override
  _Exp3State createState() => _Exp3State();
}

class _Exp3State extends State<Exp3> {
  int _currentIndex = 0;
  IconData _middleIcon = Icons.pause_circle;
  List<String> _images = [
    "assets/Totonho.png",
    "assets/Claudio.png",
    "assets/image2.png",
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_middleIcon == Icons.pause_circle) {
        _nextImage();
      }
    });
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  void togglePlayPause() {
    setState(() {
      _middleIcon =
          _middleIcon == Icons.pause_circle ? Icons.play_circle : Icons.pause_circle;
    });
  }

  void goToPreviousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _images.length;
    });
  }

  void goToNextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 74, 247),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Exposição',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 74, 247),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Image.asset(
              _images[_currentIndex],
              key: ValueKey<String>(_images[_currentIndex]),
              fit: BoxFit.contain,
              width: screenWidth * 0.9,
              height: screenHeight * 0.6,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 0, 74, 247),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_circle_left_sharp),
              iconSize: screenWidth * 0.1,
              color: Colors.white,
              onPressed: goToPreviousImage,
            ),
            IconButton(
              icon: Icon(_middleIcon),
              iconSize: screenWidth * 0.1,
              color: Colors.white,
              onPressed: togglePlayPause,
            ),
            IconButton(
              icon: Icon(Icons.arrow_circle_right_sharp),
              iconSize: screenWidth * 0.1,
              color: Colors.white,
              onPressed: goToNextImage,
            ),
          ],
        ),
      ),
    );
  }
}
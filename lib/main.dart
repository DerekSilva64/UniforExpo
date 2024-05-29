import 'package:flutter/material.dart';
import 'package:unifor_expo/preCarregamento.dart';

void main() {
  runApp(UniforExpo());
}

class UniforExpo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaPrecarregamento(),
    );
  }
}
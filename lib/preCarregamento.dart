import 'package:flutter/material.dart';
import 'package:unifor_expo/opcoesEntrar.dart';

class TelaPrecarregamento extends StatefulWidget {
  @override
  _TelaPrecarregamentoState createState() => _TelaPrecarregamentoState();
}

class _TelaPrecarregamentoState extends State<TelaPrecarregamento> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaOpcao()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 74, 247),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Logo-anim.png',
                  height: constraints.maxHeight * 0.3,
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

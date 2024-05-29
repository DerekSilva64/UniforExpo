import 'package:flutter/material.dart';
import 'package:unifor_expo/cadastro.dart';
import 'package:unifor_expo/login.dart';

class TelaOpcao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TelaOpcaoBody(),
      backgroundColor: Color.fromARGB(255, 0, 74, 247),
    );
  }
}

class TelaOpcaoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.15),
                child: Image.asset(
                  'assets/Logo-anim.png',
                  height: constraints.maxHeight * 0.2, // Ajuste de altura responsivo
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.1),
              Center(
                child: Text(
                  "Venha conhecer o centro de artes da melhor universidade!",
                  style: TextStyle(
                    fontSize: constraints.maxWidth * 0.06, // Ajuste de tamanho de fonte responsivo
                    fontFamily: 'Bold',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.08),
              SizedBox(
                width: constraints.maxWidth * 0.8,
                height: constraints.maxHeight * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaCadastro()),
                    );
                  },
                  child: Text(
                    'Criar uma conta',
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.07, // Ajuste de tamanho de fonte responsivo
                      fontFamily: 'Bold',
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF172363),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.03),
              SizedBox(
                width: constraints.maxWidth * 0.8,
                height: constraints.maxHeight * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaLogin()),
                    );
                  },
                  child: Text(
                    'Entrar em uma conta',
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.07, // Ajuste de tamanho de fonte responsivo
                      fontFamily: 'Bold',
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF172363),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

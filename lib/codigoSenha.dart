import 'package:flutter/material.dart';
import 'package:unifor_expo/novaSenha.dart';

class TelaEsperandoCodigo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 74, 247),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color.fromARGB(255, 0, 74, 247),
      body: Center(
        child: SingleChildScrollView( // Adicionado um SingleChildScrollView para tornar o conteúdo rolável
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01), // Alteração para usar altura do dispositivo
                child: Image.asset(
                  'assets/Logo-anim.png',
                  height: MediaQuery.of(context).size.height * 0.15, // Alteração para usar altura do dispositivo
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Alteração para usar altura do dispositivo
              Text(
                'Esperando o código de confirmação...',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05, // Alteração para usar largura do dispositivo
                  color: Colors.white, // Você pode definir a cor do texto aqui
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Alteração para usar altura do dispositivo
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1), // Alteração para usar largura do dispositivo
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Código de confirmação',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03), // Alteração para usar altura do dispositivo
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1, // Alteração para usar altura do dispositivo
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1), // Alteração para usar largura do dispositivo
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaRedefinirSenha()),
                      );
                    },
                    child: Text(
                      'Enviar código',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07, // Alteração para usar largura do dispositivo
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

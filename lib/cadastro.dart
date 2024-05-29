import 'package:flutter/material.dart';
import 'package:unifor_expo/cadastroF2.dart';
import 'package:unifor_expo/login.dart';

class TelaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 74, 247),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: RealizarCadastro(),
      backgroundColor: Color.fromARGB(255, 0, 74, 247),
    );
  }
}

class RealizarCadastro extends StatefulWidget {
  @override
  _RealizarCadastroState createState() => _RealizarCadastroState();
}

class _RealizarCadastroState extends State<RealizarCadastro> {
  bool _passwordVisible = false;

  TextEditingController fieldEmail = TextEditingController();
  TextEditingController fieldSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: constraints.maxHeight * 0.02),
                  child: Image.asset(
                    'assets/Logo-anim.png',
                    height: constraints.maxHeight * 0.15,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Center(
                  child: Text(
                    "Faça parte do centro cultural da melhor!",
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.06,
                      fontFamily: 'Bold',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                  child: TextField(
                    controller: fieldEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                  child: TextFormField(
                    controller: fieldSenha,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_passwordVisible ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                SizedBox(
                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxHeight * 0.1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProsseguirCadastro()),
                        );
                      },
                      child: Text(
                        'Prosseguir',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.07,
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
                SizedBox(height: constraints.maxHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Já possui uma conta?",
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TelaLogin()),
                        );
                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.04,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.25,
                      height: 1,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
                      child: Text(
                        "Entrar com",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth * 0.25,
                      height: 1,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: constraints.maxHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Ação ao pressionar o botão do Google
                        },
                        icon: Image.asset(
                          'assets/Google_logo.png',
                          width: constraints.maxWidth * 0.15,
                          height: constraints.maxWidth * 0.15,
                        ),
                      ),
                    ),
                    SizedBox(width: constraints.maxWidth * 0.05),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Ação ao pressionar o botão da Microsoft
                        },
                        icon: Image.asset(
                          'assets/microsoft_logo.png',
                          width: constraints.maxWidth * 0.15,
                          height: constraints.maxWidth * 0.15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
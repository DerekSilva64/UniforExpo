import 'package:flutter/material.dart';
import 'package:unifor_expo/cadastro.dart';
import 'package:unifor_expo/codigoSenha.dart';
import 'package:unifor_expo/homePage.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool manterConectada = false;
  bool _passwordVisible = false;

  TextEditingController fieldEmailLogin = TextEditingController();
  TextEditingController fieldSenhaLogin = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Método para exibir o pop-up
  Future<void> _mostrarPopUpEsqueceuSenha(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Esqueceu a senha?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Digite seu email para redefinir sua senha.'),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Enviar'),
              onPressed: () async {

                String codigo = generateCode();

                final url = Uri(
                scheme: 'mailto',
                path: emailController.text,
                query: 'subject=Redefinição de Senha&body=Redefina sua senha usando este código: $codigo',
                );

                if(await canLaunchUrl(url)){                      
                  launchUrl(url);
                }
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaEsperandoCodigo()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  String generateCode() {
    List<int> nums = [];
    String code = '';
    Random random = Random();

    for (int i = 0; i < 8; i++) {
      nums.add(random.nextInt(16)); // Gera um número aleatório entre 0 e 15
    }
    for (int num in nums) {
      code += num.toRadixString(16).toUpperCase(); // Converte o número para hexadecimal e transforma em maiúsculas
    }
    return code;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 74, 247),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            color: Color.fromARGB(255, 0, 74, 247),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: constraints.maxHeight * 0.01),
                      child: Image.asset(
                        'assets/Logo-anim.png',
                        height: constraints.maxHeight * 0.15,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Center(
                      child: Text(
                        "Bem vindo de volta a melhor",
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
                        controller: fieldEmailLogin,
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
                        controller: fieldSenhaLogin,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: manterConectada,
                                onChanged: (newValue) {
                                  setState(() {
                                    manterConectada = newValue!;
                                  });
                                },
                                activeColor: Colors.white,
                              ),
                              Text(
                                'Manter conectado!',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              _mostrarPopUpEsqueceuSenha(context);
                            },
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    SizedBox(
                      width: constraints.maxWidth * 0.8,
                      height: constraints.maxHeight * 0.1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TelaPrincipal()),
                            );
                          },
                          child: Text(
                            'Entrar',
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
                          "Não possui uma conta?",
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
                              MaterialPageRoute(builder: (context) => TelaCadastro()),
                            );
                          },
                          child: Text(
                            'Criar conta',
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
                            iconSize: constraints.maxWidth * 0.15,
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
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:unifor_expo/editInfo.dart';
import 'package:unifor_expo/opcoesEntrar.dart';

class TelaConfiguracoes extends StatefulWidget {
  @override
  _TelaConfiguracoesState createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  bool _notificationsEnabled = false;
  bool _audioDesc = false; // Estado para controlar as notificações
  String _selectedLanguage = 'Português'; // Defina o idioma inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(color: Colors.white), // Linha de divisão
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0), // Adiciona espaçamento à esquerda
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notificações',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        SizedBox(height: 5), // Espaçamento entre os textos
                        Text(
                          'Receba atualizações das exposições disponíveis',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value; // Atualiza o estado
                    });
                  },
                  activeColor: Colors.green, // Define a cor quando ativado
                ),
                SizedBox(width: 10), // Espaçamento da borda direita
              ],
            ),
            Divider(color: Colors.white,),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0), // Adiciona espaçamento à esquerda
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Audiodescrição',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        SizedBox(height: 5), // Espaçamento entre os textos
                        Text(
                          'Ative a audiodescrição na apresentação das obras',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Switch(
                  value: _audioDesc,
                  onChanged: (value) {
                    setState(() {
                      _audioDesc = value; // Atualiza o estado
                    });
                  },
                  activeColor: Colors.green, // Define a cor quando ativado
                ),
                SizedBox(width: 10), // Espaçamento da borda direita
              ],
            ),
            Divider(color: Colors.white), // Linha de divisão
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0), // Adiciona espaçamento à esquerda
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Idioma',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        SizedBox(height: 5), // Espaçamento entre os textos
                        Text(
                          'Altere o idioma conforme sua preferência',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _selectedLanguage,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedLanguage = newValue; // Atualiza o idioma selecionado
                      });
                      // Implemente a lógica para alterar o idioma
                    }
                  },
                  dropdownColor: Color.fromARGB(255, 0, 74, 247), // Definindo a cor de fundo do dropdown
                  items: <String>['Português', 'Inglês', 'Espanhol']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 18, color: Colors.white), // Alterado para branco
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(width: 10), // Espaçamento da borda direita
              ],
            ),
            Divider(color: Colors.white), // Linha de divisão
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0), // Adiciona espaçamento à esquerda
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Editar dados',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        SizedBox(height: 5), // Espaçamento entre os textos
                        Text(
                          'Altere dados pessoais da sua conta',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaEditarInfo()),
                    );
                  },
                  child: Text(
                    'Editar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(60, 60), // Define o tamanho mínimo do botão (largura, altura)
                    ),
                  ),
                ),
                SizedBox(width: 10), // Espaçamento da borda direita
              ],
            ),
            Divider(color: Colors.white), // Linha de divisão
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1, // Usando altura do dispositivo para o botão
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2), // Usando largura do dispositivo para o padding horizontal
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Você tem certeza que quer sair?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => TelaOpcao()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text('Sim'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Sair da conta',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Bold',
                      color: Color.fromARGB(255, 184, 12, 0),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 255, 255),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color.fromARGB(255, 184, 12, 0)), // Adicionando borda
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 74, 247),
    );
  }
}

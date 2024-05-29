import 'package:flutter/material.dart';
import 'package:unifor_expo/expo2.dart';

class Screen2 extends StatefulWidget {
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String _selectedLanguage = 'Português';
  bool _isAudiodescricaoEnabled = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 74, 247),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Descrição',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 74, 247),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.2,
                backgroundImage: AssetImage('assets/elefantes.png'),
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                    child: Text(
                      'A mostra “Fabricando Elefantes Todos os Dias” homenageia a vida e obra de Claudio Cesar, destacando suas obras mais representativas. A curadoria de Andréa Dall’Olio conduz os visitantes por uma jornada imersiva no universo surrealista do artista, revelando suas habilidades artísticas e nuances simbólicas. A exposição é descrita como um percurso labiríntico.',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Ativar audiodescrição:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Switch(
                    value: _isAudiodescricaoEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isAudiodescricaoEnabled = value;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Alterar idioma:',
                    style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  DropdownButton<String>(
                    value: _selectedLanguage,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedLanguage = newValue;
                        });
                      }
                    },
                    dropdownColor: Color.fromARGB(255, 0, 74, 247),
                    items: <String>['Português', 'Inglês', 'Espanhol']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.08,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Exp2()));
                    },
                    child: Text(
                      'Exposição!',
                      style: TextStyle(
                        fontSize: screenWidth * 0.07,
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
                          borderRadius: BorderRadius.circular(screenWidth * 0.05),
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

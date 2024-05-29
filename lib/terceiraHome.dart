import 'package:flutter/material.dart';
import 'package:unifor_expo/card1.dart';
import 'package:unifor_expo/card2.dart';
import 'package:unifor_expo/card3.dart';

class TelaPessoa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 0, 74, 247), // Cor de fundo
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildCard(
              context,
              'Totonho Laprovitera',
              'assets/totCard.png',
              'Colecionando Afetos',
              () {
                // Navegar para a tela 1
                _navigateToScreen1(context);
              },
            ),
            Divider(color: Colors.white),
            _buildCard(
              context,
              'Claudio Cesar',
              'assets/claudioCard.png',
              'Fabricando elefantes todos os dias',
              () {
                // Navegar para a tela 2
                _navigateToScreen2(context);
              },
            ),
            Divider(color: Colors.white),
            _buildCard(
              context,
              'Coleção de Igor Queiroz',
              'assets/card.png',
              'Centelhas em movimento',
              () {
                // Navegar para a tela 3
                _navigateToScreen3(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    String imagePath,
    String exhibitionName,
    VoidCallback onTap,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardHeight = screenWidth * 0.6;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Ajuste conforme necessário
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: cardHeight * 0.5,
            ),
            SizedBox(height: 8.0),
            Container(
              height: cardHeight * 0.2,
              color: Colors.white,
              child: Center(
                child: Text(
                  exhibitionName,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Ajuste conforme necessário
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen1(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1()));
  }

  void _navigateToScreen2(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
  }

  void _navigateToScreen3(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen3()));
  }
}

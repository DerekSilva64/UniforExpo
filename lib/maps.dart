import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaMapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Color.fromARGB(255, 0, 74, 247), // Altere a cor de fundo conforme necessário
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                final webPage = Uri.parse('https://www.google.com/maps/place/Espaço+Cultural+Unifor/@-3.7689843,-38.4840332,17z/data=!3m1!4b1!4m6!3m5!1s0x7c746009b1ebe63:0xf6b988117a9e27ca!8m2!3d-3.7689843!4d-38.4814529!16s%2Fg%2F1q2w6ltc_?entry=ttu');

                launchUrl(
                  webPage,
                  mode: LaunchMode.externalApplication,);
              },
              child: Image.asset(
                'assets/mapa.png',
                height: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.08,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Expanded(
                  child: Text(
                    "Av. Washington Soares, 1321 - Edson Queiroz",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.08,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Expanded(
                  child: Text(
                    "Segunda: Fechado\nTerça - Sexta: 9:00-19:00\nSábado e Domingo: 12:00-18:00",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.08,
                child: ElevatedButton(
                  onPressed: () {
                    final webPage = Uri.parse('https://www.google.com/maps/place/Espaço+Cultural+Unifor/@-3.7689843,-38.4840332,17z/data=!3m1!4b1!4m6!3m5!1s0x7c746009b1ebe63:0xf6b988117a9e27ca!8m2!3d-3.7689843!4d-38.4814529!16s%2Fg%2F1q2w6ltc_?entry=ttu');

                launchUrl(
                  webPage,
                  mode: LaunchMode.externalApplication,);
                  },
                  child: Text(
                    'Abrir no Maps',
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
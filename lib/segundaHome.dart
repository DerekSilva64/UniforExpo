import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaCalendario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                    child: Image.asset(
                      'assets/Logo-anim.png',
                      height: constraints.maxHeight * 0.15,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                    child: Text(
                      'O Centro de Artes da Universidade de Fortaleza - Unifor adoraria recebê-lo. Para isso, entre em contato conosco e agende o melhor horário para você. Venha aproveitar o que só a MELHOR tem para oferecer!',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.08,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Expanded(
                        child: Text(
                          "(85) 123456789",
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
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                    child: SizedBox(
                      width: double.infinity,
                      height: constraints.maxHeight * 0.08,
                      child: ElevatedButton(
                        onPressed: () async {
                          String phone = '(85)123456789';
                          final url = Uri(scheme: 'tel', path: phone);

                          if(await canLaunchUrl(url)){
                            launchUrl(url);
                          }
                        },
                        child: Text(
                          'Entrar em contato',
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
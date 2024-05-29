import 'package:flutter/material.dart';

class TelaDiretriz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 74, 247),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Image.asset(
                'assets/Logo-anim.png',
                height: MediaQuery.of(context).size.height * 0.2, // Usando a altura do dispositivo para o tamanho da imagem
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Termos de uso e privacidade',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06, // Ajustando o tamanho da fonte com base na largura do dispositivo
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    """Com a finalidade desta comunidade prosseguir de maneira positiva e de forma construtiva é solicitado que as seguintes diretrizes:

1) Respeito Mutuo e da não discriminação:

    Pede-se que respeite todas as pessoas presentes, independentemente de sua origem, identidade de gênero, opiniões, etnia ou religião. Comportamento discriminatório, ofensivo ou intimidador não será tolerado.

2) Privacidade e Segurança:

    Respeite a privacidade dos outros membros desta comunidade, e para sua segurança não compartilhe informações pessoais. Nos nunca ligaremos solicitando informaçoes pessoais, confidenciais ou sensíveis.

3) Denúncias de Problemas:

    Caso por ventura encontre algo inadequado ou tiver problemas com o comportamento de um outro visitante, denuncie para os moderadores imediatamente. Isso nos ajuda a manter a comunidade segura e saudável para todos.

4) Responsabilidade do usuário:

    Cada visitante é responsável por seus atos, bem como pelos atos daqueles que represente. Ao participar, você concorda em seguir estas diretrizes e aceitar as decisões dos moderadores.

5) Atualizações e Revisões:

    Estes termos de uso e Diretrizes podem mudar a qualquer tempo, com a finalidade de garantir sua eficiência e relevância aos membros desta comunidade. Os membros serão informados sobre quaisquer mudanças significativas.

6) Contato:

    Caso tenha dúvidas ou precisar de assistência, sintase livre para entrar em contato com os moderadores do centro cultural da Universidade de Fortaleza (UNIFOR).  Estamos aqui para ajudar e garantir uma experiência positiva para todos.


    Agradecemos por fazer parte desta comunidade e com seu auxílio tornaremos este ambiente cada vez melhor, acolhedor e respeitoso
""",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04, // Ajustando o tamanho da fonte com base na largura do dispositivo
                      fontFamily: 'Bold',
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
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

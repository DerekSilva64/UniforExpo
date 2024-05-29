import 'package:flutter/material.dart';
import 'package:unifor_expo/login.dart';
import 'package:unifor_expo/diretrizes.dart';

class ProsseguirCadastro extends StatefulWidget {
  @override
  _ProsseguirCadastroState createState() => _ProsseguirCadastroState();
}

class _ProsseguirCadastroState extends State<ProsseguirCadastro> {
  bool concordaTermos = false;
  DateTime? _selectedDate;

  TextEditingController fieldNome = TextEditingController();
  TextEditingController _fieldDate = TextEditingController();

  final List<String> nacionalidades = [
    'Afegão', 'Albanês', 'Argelino', 'Andorrano', 'Angolano', 'Antiguano', 'Argentino', 'Armênio', 
    'Australiano', 'Austríaco', 'Azerbaijano', 'Bahamense', 'Bareinita', 'Bangladês', 'Barbadiano',
    'Bielorrusso', 'Belga', 'Belizenho', 'Beninense', 'Butanês', 'Boliviano', 'Bósnio', 'Botsuanense',
    'Brasileiro', 'Bruneano', 'Búlgaro', 'Burquinense', 'Burundiano', 'Cabo-verdiano', 'Cambojano',
    'Camarônio', 'Canadense', 'Chadiano', 'Chileno', 'Chinês', 'Colombiano', 'Comorense', 'Congolês',
    'Costa-riquenho', 'Croata', 'Cubano', 'Cipriota', 'Tcheco', 'Dinamarquês', 'Djibutiano', 'Dominicano',
    'Holandês', 'Timorense', 'Equatoriano', 'Egípcio', 'Salvadorenho', 'Guinéu-equatoriano', 'Eritreu',
    'Estoniano', 'Etíope', 'Fijiano', 'Filipino', 'Finlandês', 'Francês', 'Gabão', 'Gambiano', 'Georgiano',
    'Alemão', 'Ganês', 'Grego', 'Granadino', 'Guatemalteco', 'Guineano', 'Guiné-bissauense', 'Guyanês',
    'Haitiano', 'Hondurenho', 'Húngaro', 'Islandês', 'Indiano', 'Indonésio', 'Iraniano', 'Iraquiano',
    'Irlandês', 'Israelense', 'Italiano', 'Marfinense', 'Jamaicano', 'Japonês', 'Jordaniano', 'Cazaque',
    'Queniano', 'Kitticiano', 'Kuwaitiano', 'Quirguistanês', 'Laosiano', 'Letão', 'Libanês', 'Lesotiano',
    'Liberiano', 'Líbio', 'Liechtensteinense', 'Lituano', 'Luxemburguês', 'Macedônio', 'Malgaxe', 'Malauiano',
    'Malaio', 'Maldivo', 'Maliano', 'Maltês', 'Marroquino', 'Marshallino', 'Mauritano', 'Mauriciano', 
    'Mexicano', 'Micronésio', 'Moldavo', 'Monegasco', 'Mongol', 'Montenegrino', 'Marroquino', 'Moçambicano',
    'Birmanês', 'Namibiano', 'Nauruano', 'Nepalês', 'Neozelandês', 'Nicaraguense', 'Nigerino', 'Nigeriano',
    'Norte-coreano', 'Norueguês', 'Omâni', 'Paquistanês', 'Palauano', 'Palestino', 'Panamenho', 'Papua-neoguineano',
    'Paraguaio', 'Peruano', 'Filipino', 'Polonês', 'Português', 'Catarense', 'Romeno', 'Russo', 'Ruandês', 'São-cristovense',
    'São-tomense', 'São-vicentino', 'Samoano', 'San-marinhense', 'Saudita', 'Senegalês', 'Sérvio', 'Seychellense', 
    'Serra-leonês', 'Singapurense', 'Eslovaco', 'Esloveno', 'Ilhoense-salomão', 'Somali', 'Sul-africano', 'Sul-coreano',
    'Sudanês', 'Sudanês-do-sul', 'Espanhol', 'Srilankês', 'Sudanês', 'Surinamês', 'Eswatiniano', 'Sueco', 'Suíço',
    'Sírio', 'Taiwanês', 'Tadjique', 'Tanzaniano', 'Tailandês', 'Timorense', 'Togolês', 'Tonganês', 'Trinitário', 
    'Tunisiano', 'Turcomeno', 'Turco', 'Tuvaluano', 'Ugandense', 'Ucraniano', 'Emirati', 'Britânico', 'Americano',
    'Uruguaio', 'Uzbeque', 'Vanuatuano', 'Venezuelano', 'Vietnamita', 'Iemenita', 'Zambiano', 'Zimbabuense'
  ];

  String? selectedNacionalidade;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _fieldDate.text = "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}";
      });
    }
  }

  void _showSuccessPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Conta registrada com sucesso"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => TelaLogin())
                );
              },
              child: Text("Ótimo!"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 74, 247),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Color.fromARGB(255, 0, 74, 247),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.05),
                  child: Image.asset(
                    'assets/Logo-anim.png',
                    height: screenSize.height * 0.2,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                Center(
                  child: Text(
                    "Estamos quase lá...",
                    style: TextStyle(
                      fontSize: screenSize.width * 0.06,
                      fontFamily: 'Bold',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: TextField(
                    controller: fieldNome,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: DropdownButtonFormField<String>(
                    value: selectedNacionalidade,
                    decoration: InputDecoration(
                      labelText: 'Nacionalidade',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: nacionalidades.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedNacionalidade = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: TextFormField(
                    controller: _fieldDate,
                    keyboardType: TextInputType.datetime,
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                    decoration: InputDecoration(
                      labelText: 'Data de nascimento',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: Row(
                    children: [
                      Checkbox(
                        value: concordaTermos,
                        onChanged: (newValue) {
                          setState(() {
                            concordaTermos = newValue!;
                          });
                        },
                        activeColor: Colors.white,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TelaDiretriz()),
                          );
                        },
                        child: Text(
                          'Concordo com os termos de uso',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.04,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.04),
                SizedBox(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.1,
                  child: ElevatedButton(
                    onPressed: () {
                      _showSuccessPopUp(context); // Mostrar o pop-up de sucesso
                    },
                    child: Text(
                      'Finalizar',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.07,
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:unifor_expo/config.dart';
import 'package:unifor_expo/maps.dart';
import 'package:unifor_expo/primeiraHome.dart';
import 'package:unifor_expo/segundaHome.dart';
import 'package:unifor_expo/terceiraHome.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _selectedIndex = 0;

  List<Widget> _telas = <Widget>[
    TelaPerfil(),
    TelaCalendario(),
    TelaPessoa(),
    TelaMapa(),
    TelaConfiguracoes(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // Ação desejada ao tocar no ícone do logotipo
          },
          child: Image.asset(
            'assets/Logo-anim.png',
            width: 200, // Ajuste conforme necessário
            height: 50, // Ajuste conforme necessário
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 74, 247),
      ),
      body: _telas[_selectedIndex],
      backgroundColor: Color.fromARGB(255, 0, 74, 247),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: ' '),
          TabItem(icon: Icons.calendar_today, title: ' '),
          TabItem(icon: Icons.person, title: ' '),
          TabItem(icon: Icons.map, title: ' '),
          TabItem(icon: Icons.settings, title: ' '),
        ],
        activeColor: Colors.white,
        backgroundColor: Color(0xFF172363),
        onTap: _onItemTapped,
        initialActiveIndex: _selectedIndex,
        style: TabStyle.fixed,
      ),
    );
  }
}

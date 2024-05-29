import 'package:flutter/material.dart';

class TelaPerfil extends StatefulWidget {
  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> with WidgetsBindingObserver {
  int _bannerIndex = 0;
  List<String> _banners = [
    'assets/image2.png',
    'assets/Totonho.png',
    'assets/Claudio.png'
  ];

  @override
  void initState() {
    super.initState();
    _startBannerLoop();
    WidgetsBinding.instance.addObserver(this); // Adiciona o observer
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove o observer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: SizedBox(
          key: ValueKey<int>(_bannerIndex),
          width: screenSize.width,
          height: screenSize.height,
          child: Image.asset(
            _banners[_bannerIndex],
            key: ValueKey<String>(_banners[_bannerIndex]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _stopBannerLoop(); // Pausa o loop quando a aplicação é pausada
    } else if (state == AppLifecycleState.resumed) {
      _startBannerLoop(); // Retoma o loop quando a aplicação é retomada
    }
  }

  void _startBannerLoop() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _bannerIndex = (_bannerIndex + 1) % _banners.length;
        });
        _startBannerLoop();
      }
    });
  }

  void _stopBannerLoop() {
    // Cancela o loop
    // Não é necessário fazer nada aqui, pois o setState não será chamado quando a tela estiver pausada
  }
}

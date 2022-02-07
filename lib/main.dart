import 'package:flutter/material.dart';

void main() {
  runApp(CounterPeopleApp());
}

class CounterPeopleApp extends StatefulWidget {
  CounterPeopleApp({Key? key}) : super();

  @override
  State<CounterPeopleApp> createState() => _CounterPeopleAppState();
}

class _CounterPeopleAppState extends State<CounterPeopleApp> {
  final String urlImage = 'assets/images/background.jpg';

  bool _idNotLotado = true;

  final int _limit = 20;

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter People',
      home: Scaffold(
          body: BackgroundImage(
            urlImage: urlImage,
            child: Container(
              padding: const EdgeInsets.all(60),
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  TitleVisibility(
                    title: 'Pode entrar!',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    visible: _idNotLotado,
                    color: Colors.white,
                  ),
                  TitleVisibility(
                    title: 'Lotado',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    visible: (_idNotLotado ? false : true),
                    color: Colors.red,
                  ),
                  const SizedBox(height: 90),
                  Text(
                    _counter.toString(),
                    style: TextStyle(
                      color: (_idNotLotado ? Colors.white : Colors.red),
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: _counter > 0 ? sair : null,
                        child: const Text('Saiu'),
                        style: TextButton.styleFrom(
                          backgroundColor: _counter == 0 ? Colors.white.withOpacity(0.4) : Colors.white,
                          fixedSize: const Size(120, 120),
                          primary: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 30),
                      TextButton(
                        onPressed: _idNotLotado ? entrar : null,
                        child: const Text('Entrou'),
                        style: TextButton.styleFrom(
                            backgroundColor: _idNotLotado ? Colors.white : Colors.white.withOpacity(0.2),
                            fixedSize: const Size(120, 120),
                            primary: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void entrar() {
    if (_counter < _limit) {
      setState(() {
        _counter++;
      });
    }

    if (_counter == _limit) _idNotLotado = false;
  }

  void sair() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }

    if (_counter < _limit) _idNotLotado = true;
  }
}

class BackgroundImage extends StatelessWidget {
  final String urlImage;
  final Widget? child;

  const BackgroundImage({Key? key, required this.urlImage, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            urlImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class TitleVisibility extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  bool visible;
  Color color;

  TitleVisibility({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.fontWeight,
    this.visible = false,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

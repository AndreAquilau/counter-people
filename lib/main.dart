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
      home: Scaffold(
          body: SingleChildScrollView(
        child: BackgroundImage(
          urlImage: urlImage,
          child: Container(
            padding: const EdgeInsets.all(60),
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(height: 40),
                TitleVisibility(
                  title: 'Pode entrar!',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  visible: _idNotLotado,
                ),
                TitleVisibility(
                  title: 'Lotado',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  visible: (_idNotLotado ? false : true),
                ),
                const SizedBox(height: 90),
                Text(
                  _counter.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (_counter > 0) {
                          setState(() {
                            _counter--;
                          });
                        }

                        if (_counter < _limit) _idNotLotado = true;
                      },
                      child: const Text('Saiu'),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(120, 120),
                        primary: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () {
                        if (_counter < _limit) {
                          setState(() {
                            _counter++;
                          });
                        }

                        if (_counter == _limit) _idNotLotado = false;
                      },
                      child: const Text('Entrou'),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: const Size(120, 120),
                          primary: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
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

  TitleVisibility({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.fontWeight,
    this.visible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

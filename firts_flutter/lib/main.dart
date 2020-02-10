import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contador de pessoas",
      home: HomeState()
  ));
}

class HomeState extends StatefulWidget {
  @override
  _HomeStateState createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  int _people = 0;
  String _text_information = "Pode Entrar!";
  void _Changedpeople(int delta){
    setState(() {
      _people += delta;
      if (_people < 0){
        _text_information = "Mundo Invertido";
      }
      else if(_people <= 10){
        _text_information = "Pode Entrar!";
      }
      else{
        _text_information = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
            "images/restaurant.jpg", fit: BoxFit.cover, height: 1000),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          /*Eixo principal aliado para o centro*/
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style: TextStyle(
                            color: Colors.greenAccent, fontSize: 40.00)),
                    onPressed: () {
                      _Changedpeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style:
                        TextStyle(
                            color: Colors.greenAccent, fontSize: 40.00)),
                    onPressed: () {
                      _Changedpeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              "$_text_information",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.00),
            )
          ],
        )
      ],
    );
  }
}

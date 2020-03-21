import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(errorColor: Colors.blueAccent),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infotext = "Informe seus dados!";

  void _resetfield(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infotext = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });

  }
  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      double imc = (weight / (height * height))*10000;

      if (imc <  18.2){
        _infotext = "Abaixo do Peso ${imc.toStringAsPrecision(2)}";
      }
      else if(imc >=  18.2 && imc < 24.9){
        _infotext = "Peso Ideal ${imc.toStringAsPrecision(2)}";
      }
      else if (imc >=  24.9 && imc < 29.9){
        _infotext = "Levemente Acima Peso ${imc.toStringAsPrecision(2)}";
      }
      else if (imc >=  29.4 && imc < 34.9){
        _infotext = "Obesidade Grau I ${imc.toStringAsPrecision(2)}";
      }
      else if (imc >=  34.9 && imc < 39.9){
        _infotext = "Obesidade Grau II ${imc.toStringAsPrecision(2)}";
      }
      else if (imc >=  40){
        _infotext = "Obesidade Grau III ${imc.toStringAsPrecision(2)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Imc"),
        centerTitle: true,
        backgroundColor: Color(0xFFEC407A),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetfield),
        ],
      ),
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10,0,10,0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120, color: Color(0xFFEC407A)),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso em (Kg)",
                    labelStyle: TextStyle(color: Colors.white)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
                controller: weightController,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira o seu Peso!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura em (cm)",
                    labelStyle: TextStyle(color: Colors.white)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
                controller: heightController,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty){
                    return "Insira a sua Altura!";
                  }
                },
              ),

              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child:  Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _calculate();
                      }
                    },
                    child: Text("Calcular",
                      style: TextStyle(color:  Colors.white, fontSize: 17.0),
                    ),
                    color: Color(0xFFEC407A),
                  ),
                ),
              ),
              Text(_infotext,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 17)
                ,)
            ],
          ),
        )

      ),
    );
  }
}

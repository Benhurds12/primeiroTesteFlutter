import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Registro de consumo de água", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _water = 0;
  String _mensagem = "Se Hidrate!";
  TextEditingController _customWaterController = TextEditingController();

  void _changeWater(int delta) {
    setState(() {
      _water += delta;
      if (_water >= 3000) {
        _mensagem = "Já atingiu a meta diária.";
        _water = 3000;
      } else if (_water < 3000 && _water >= 0) {
        _mensagem = "Tem que tomar mais água!";
      } else {
        _water = 0;
        _mensagem = "Novo dia começando!";
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "Downloads/waterwallpaper.jpeg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Meta 3000ML: $_water",
              style: TextStyle(
                color: Colors.yellowAccent,
                 fontWeight: FontWeight.bold,
                 fontSize: 40.0,
                 fontFamily: 'Roboto',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "+100",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changeWater(100);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "+200",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changeWater(200);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "Reset",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changeWater(-_water);
                    },
                  ),
                ),
              ],
            ),
            Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Padding(
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: Text(
          "Custom",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Inserir valor customizável"),
                content: TextField(
                  controller: _customWaterController,
                  keyboardType: TextInputType.number,
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text("Enviar"),
                    onPressed: () {
                      int customWater = int.parse(_customWaterController.text);
                      _changeWater(customWater);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    ),
  ],
),
            Text(
              _mensagem,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
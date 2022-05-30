import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomePage> {
  String saida = "0";
  String _saida = "0";
  double n1 = 0.0;
  double n2 = 0.0;
  String operando = "";

  buttonPressed(String valor_botao) {
    print(valor_botao);

    if (valor_botao == "AC") {
      _saida = "0";
      n1 = 0.0;
      n2 = 0.0;
      operando = "";
    } else if (valor_botao == "+" ||
        valor_botao == "-" ||
        valor_botao == "x" ||
        valor_botao == "/") {
      n1 = double.parse(saida);
      operando = valor_botao;
      _saida = "0";
      saida = saida + valor_botao;
    } else if (valor_botao == ".") {
      if (_saida.contains(".")) {
        print("Já existe");
        return;
      } else {
        _saida = _saida + valor_botao;
      }
    } else if (valor_botao == "=") {
      n2 = double.parse(saida);
      if (operando == "+") {
        _saida = (n2 + n1).toString();
      }
      if (operando == "-") {
        _saida = (n1 - n2).toString();
      }
      if (operando == "x") {
        _saida = (n2 * n1).toString();
      }
      if (operando == "/") {
        _saida = (n1 / n2).toString();
      }
      n1 = 0.0;
      n2 = 0.0;
    } else {
      _saida = _saida + valor_botao;
    }
    setState(() {
      saida = double.parse(_saida).toStringAsFixed(2);
    });
  }

  Widget buildButton(String ButtonValue) {
    return new Expanded(
        child: Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Text(
          ButtonValue,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        onPressed: () => buttonPressed(ButtonValue),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
            title: Text(
              'Calc_Túlio',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black45),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                  child: Text(
                    saida,
                    style: TextStyle(
                      fontSize: 60.0,
                    ),
                  )),
              Divider(),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton("AC"),
                      buildButton("+/-"),
                      buildButton("%"),
                      buildButton("/")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("x")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("-")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("+")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("0"),
                      buildButton('.'),
                      buildButton("="),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

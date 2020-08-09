import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List _historyList = [];

class _HomeState extends State<Home> {
  var _salarioBruto = TextEditingController();
  var _dependentes = TextEditingController();
  var _descontos = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Calculadora de salario'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text('Awesome Salary Calculator'),
            ),
            Card(
              child: TextField(
                autofocus: true,
                onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
                controller: _salarioBruto,
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // Required for IOS to see decimals,
                decoration: InputDecoration(labelText: 'Salario Bruto'),
              ),
            ),
            Card(
              child: TextField(
                controller: _dependentes,
                onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // Required for IOS to see decimals,
                decoration: InputDecoration(labelText: 'Numero de dependentes'),
              ),
            ),
            Card(
              child: TextField(
                controller: _descontos,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => FocusScope.of(context)
                    .unfocus(), // submit and hide keyboard
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // Required for IOS to see decimals,
                decoration: InputDecoration(labelText: 'Outros Descontos'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 3,
                  child: Card(
                    color: Colors.blue,
                    elevation: 3,
                    child: FlatButton(
                      onPressed: calc_taxes,
                      child: Text("Calcular"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Card(
                    color: Colors.yellowAccent,
                    elevation: 0,
                    child: FlatButton(
                      onPressed: reset_history,
                      child: Text("Resetar historico"),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Historico")),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: _historyList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: Colors.deepPurpleAccent,
                    elevation: 2,
                    child: Text('${_historyList[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calc_taxes() {
    // Calular INSS
    final double _salarioBrutodb = double.parse(_salarioBruto.text);
    double _dependentesdb = 0;
    double _descontosdb = 0;
    double _descontoINSS = 0;
    double _aliquota = 0;
    double _deducao = 0;
    double _salarioLiquido;
    debugPrint(
        "Sl.Bruto: $_salarioBrutodb | Deps: $_dependentesdb | Desc: $_descontosdb");

    if (_dependentes.text.isNotEmpty) {
      _dependentesdb = double.parse(_dependentes.text);
    }
    if (_descontos.text.isNotEmpty) {
      _descontosdb = double.parse(_descontos.text);
    }

    // Calculo INSS
    if (_salarioBrutodb <= 1045) {
      _aliquota = 0.075; //7.5%
      _deducao = 0;
    }
    if (_salarioBrutodb > 1045 && _salarioBrutodb <= 2089.6) {
      _aliquota = 0.09; //9%
      _deducao = 15.67;
    } else if (_salarioBrutodb > 2089.6 && _salarioBrutodb <= 3134.4) {
      _aliquota = 0.12; //12%
      _deducao = 78.36;
    } else if (_salarioBrutodb > 3134.4 && _salarioBrutodb <= 6101.06) {
      _aliquota = 0.14; //12%
      _deducao = 141.05;
    }
    if (_salarioBrutodb > 6101.06) {
      // Deducao maxima
      _descontoINSS = 713.10;
    } else {
      _descontoINSS = (_salarioBrutodb * _aliquota) - _deducao;
    }
    debugPrint("Desconto INSS: $_descontoINSS");
    // Calculo Salario Base
    // Base = Bruto - INSS - (Dependentes * 189.59)
    double _taxaPorDependente = 189.59;
    double _salarioBase =
        _salarioBrutodb - _descontoINSS - (_dependentesdb * _taxaPorDependente);

    // Calculo IRPF
    double _aliquotaIRPF = 0;
    double _deducaoIRPF = 0;
    if (_salarioBase > 1903.98 && _salarioBase <= 2826.65) {
      _aliquotaIRPF = 0.075; // 7.5%
      _deducaoIRPF = 142.8;
    } else if (_salarioBase > 2826.65 && _salarioBase <= 3751.05) {
      _aliquotaIRPF = 0.15; // 15%
      _deducaoIRPF = 354.8;
    } else if (_salarioBase > 3751.05 && _salarioBase <= 4664.68) {
      _aliquotaIRPF = 0.225; // 22.5%
      _deducaoIRPF = 636.13;
    } else if (_salarioBase > 4664.68) {
      _aliquotaIRPF = 0.275; // 27.5%
      _deducaoIRPF = 869.36;
    }
    double _descontoIRPF = (_salarioBase * _aliquotaIRPF) - _deducaoIRPF;
    debugPrint(
        "Desconto IRPF: $_descontoIRPF | Aliquota: $_aliquotaIRPF(- $_deducaoIRPF)");

    // Calculo Salario Liquido
    _salarioLiquido =
        _salarioBrutodb - _descontoINSS - _descontoIRPF - _descontosdb;
    debugPrint("Bruto: $_salarioBrutodb | Liquido: $_salarioLiquido");

    if (_historyList.length >= 3) {
      _historyList.removeAt(0);
    }
    _historyList.add(
        "Bruto: R\$${_salarioBrutodb.toStringAsFixed(2)} | Liquido: R\$${_salarioLiquido.toStringAsFixed(2)} | INSS: ${_descontoINSS.toStringAsFixed(2)} |IRPF: ${_descontoIRPF.toStringAsFixed(2)}");
    _showMyDialog(_salarioLiquido.toStringAsFixed(2),
        _descontoINSS.toStringAsFixed(2), _descontoIRPF.toStringAsFixed(2));
  }

  Future<void> _showMyDialog(
      var salarioLiquido, var descINSS, var descIRPF) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Salario Liquido'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'R\$ $salarioLiquido',
                  textScaleFactor: 2,
                ),
                Text(
                    '\nDescontos: \n[INSS: R\$ $descINSS] \n[IRPF: R\$ $descIRPF]'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void reset_history() {
    setState(() {
      _historyList = [];
    });
  }
}

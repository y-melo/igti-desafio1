import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'objects/answer.dart';
import 'objects/questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IGTI - Desafio 1',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  List questions = [
    {'id': 1, 'question': 'A Soma total dos depósitos de todas as agências.'},
    {
      'id': 2,
      'question': 'O número total de contas com mais de 100 reais de saldo.'
    },
    {
      'id': 3,
      'question':
          'O número de contas com mais de 100 reais de saldo na agência 33.'
    },
    {'id': 4, 'question': 'A agência com maior saldo.'},
    {'id': 5, 'question': 'A agência com o menor saldo '},
    {
      'id': 6,
      'question':
          'Considere o cliente com o maior saldo em cada agência . O valor total desses saldos é:'
    },
    {
      'id': 7,
      'question': 'O nome do(a) cliente com o maior saldo na agência 10.'
    },
    {
      'id': 8,
      'question': 'O nome do(a) cliente com o menor saldo na agência 47.'
    },
    {
      'id': 9,
      'question':
          'nomes dos três clientes com menor saldo da agência 47(separados por vírgula e em ordem crescente).'
    },
    {'id': 10, 'question': 'Quantos clientes estão na agência 47.'},
    {
      'id': 11,
      'question': 'Quantos clientes que tem Maria no nome estão na agencia 47.'
    },
  ];
  _HomeState();

  List<String> filterQuestions() {
    List<String> questionsOnly = [];
    questions.forEach((element) {
      questionsOnly.add(element['question']);
    });
    return questionsOnly;
  }

  String response = "Choose a question above";

  @override
  Widget build(BuildContext context) {
    if (filterQuestions().length > 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Desafio 1"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              // height: 500,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: filterQuestions().length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          Answer a = new Answer(index);
                          // print(index.toString() + " " + a.toString());
                          print(a.giveAnswer());
                          setState(() {
                            this.response = a.giveAnswer();
                          });
                        },
                        elevation: 5.0,
                        child: Text(filterQuestions()[index]),
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30, top: 10),
              alignment: Alignment.bottomCenter,
              child: Text(response),
            ),
          ],
        ),
      );
    } else {
      return Text("Something is wrong here");
    }
  }
}

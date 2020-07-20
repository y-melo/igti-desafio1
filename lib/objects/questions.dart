import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  int questionIndex;
  String questionText;
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

  // factory Question.fromJson(Map<String, dynamic> parsedJson) {
  //   return Question(
  //       questionIndex: parsedJson['id'], questionText: parsedJson['question']);
  // }
  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    List<String> list = getList();

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) => Text(list[index]));
  }

  List getList() {
    List<String> questionsOnly = [];
    this.questions.forEach((element) {
      questionsOnly.add(element['questions']);
    });
  }
}

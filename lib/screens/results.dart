import 'package:desafio3_quiz/screens/home.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.correctAnwser);

  double correctAnwser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                "${correctAnwser.toStringAsFixed(2)} % de Acertos",
                textScaleFactor: 2,
              ),
            ),
            RaisedButton(
              child: Text("Recomecar"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

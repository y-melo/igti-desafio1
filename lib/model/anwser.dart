import 'package:desafio3_quiz/screens/results.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final Function selectHandler;
  final Map question;
  final int questionLength;

  QuestionCard(this.selectHandler, this.question, this.questionLength);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.4;
    return Container(
      height: _height,
      child: Card(
        elevation: 5,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(10),
              child: Text(
                "${widget.question["id"]}. ${widget.question["Question"]}",
                textScaleFactor: 1.7,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  elevation: 5,
                  child: Text('Verdade'),
                  onPressed: () {
                    Scaffold.of(context).hideCurrentSnackBar();
                    final snackBar = SnackBar(
                      content: _checkAnswer(true),
                      elevation: 5,
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                ),
                RaisedButton(
                  elevation: 5,
                  child: Text('Mentira'),
                  onPressed: () {
                    Scaffold.of(context).hideCurrentSnackBar();
                    final snackBar = SnackBar(
                      content: _checkAnswer(false),
                      elevation: 5,
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  var _anwserCount = 0;
  Widget _checkAnswer(bool response) {
    var questionLength = widget.questionLength;
    var _questionIndex = widget.question["id"];
    StringBuffer returnResp =
        new StringBuffer("${widget.question["Question"]}: $response ->");
    Color _responseColor = Colors.grey;
    if (widget.question["Anwser"] == response) {
      returnResp.write("Correct");
      _responseColor = Colors.greenAccent;
      _anwserCount++;
    } else {
      returnResp.write("Correct");
      _responseColor = Colors.redAccent;
    }
    if (_questionIndex + 1 > questionLength) {
      var _correctAnwsers = _anwserCount / questionLength * 100;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Result(_correctAnwsers)),
      );
    }
    widget.selectHandler();
    return Container(
      child: Text(
        returnResp.toString(),
        style: TextStyle(color: _responseColor),
      ),
    );
  }
}

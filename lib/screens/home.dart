import 'package:desafio3_quiz/model/anwser.dart';
import 'package:desafio3_quiz/model/questions.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.title, this.indexReset}) : super(key: key);
  final String title;
  final int indexReset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("t ${this.title}"),
      ),
      body: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 1,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text(
          'Bem vindo ao desafio 3 IGTI - Quiz',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.asset('assets/logo-igti.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: null,
        loaderColor: Colors.red);
  }
}

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

var _questionLength;
var _questionIndex = 0;

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    Questions questions = new Questions();

    return new Scaffold(
      appBar: new AppBar(
          title: new Text("IGTI, Desafio 3 - Quiz"),
          automaticallyImplyLeading: false),
      body: FutureBuilder<Map>(
          future: questions
              .loadQuestions(), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              var questionList = snapshot.data.values.elementAt(0);
              _questionLength = questionList.length;
              var aux = questionList[_questionIndex];
              // print(aux);
              return QuestionCard(
                  () => _answerQuestion(aux), aux, _questionLength);
            } else if (snapshot.hasError) {
              children = <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          }),
    );
  }

  _answerQuestion(value) {
    // print(value["HOME | _answerQuestion"]);

    setState(() {
      if (_questionIndex + 1 < _questionLength) {
        _questionIndex += 1;
      } else {
        _questionIndex = 0;
      }
    });
  }
}

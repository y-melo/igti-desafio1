import 'dart:convert';
import 'package:flutter/services.dart';

class Questions {
  int id;
  String question;
  bool anwser;

  Questions({this.id, this.question, this.anwser});

  factory Questions.fromJson(Map<String, dynamic> parsedJson) {
    return Questions(
        id: parsedJson['id'],
        question: parsedJson['question'],
        anwser: parsedJson['anwser']);
  }

  Future<String> _loadAQuestionAsset() async {
    return await rootBundle.loadString('assets/questions.json');
  }

  Future<Map> loadQuestions() async {
    String jsonString = await _loadAQuestionAsset();
    final jsonResponse = json.decode(jsonString);
    return jsonResponse;
  }
}

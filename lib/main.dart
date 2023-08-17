import 'package:flutter/material.dart';
import './question.dart';
import './choice.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void iWasTapped() => print('I was tapped');
  var questions = [
    {
      "question": "Select clothes category:",
      "answers": ["Sportswear", "Casual wear", "Business attire"],
    },
    {
      "question": "What size do you need?",
      "answers": [
        "XS",
        "S",
        "M",
        "L",
        "XL",
        "XXL",
      ],
    },
    {
      "question": "Which color should be the dominant one?",
      "answers": ["White", "Black", "Grey", "Yellow", "Blue", "Pink"]
    }
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex < questions.length - 1) {
        _questionIndex += 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello World"),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['question'].toString()),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return QuestionChoice(
                _answerQuestion,
                answer,
              );
            })
          ],
        ),
      ),
    );
  }
}

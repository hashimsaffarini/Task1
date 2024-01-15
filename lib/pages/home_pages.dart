import 'package:app1/models/questions_with_answers.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;
  bool quizCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Quiz App')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: quizCompleted ? congratsContent() : quizContent(),
        ),
      ),
    );
  }

  Widget quizContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            questionsWithAnswers[questionIndex].question,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: questionsWithAnswers[questionIndex]
              .answers
              .map((answer) => answerButton(
                    text: answer,
                    onPressed: () {
                      checkAnswer(answer);
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget congratsContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Congrats!',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              questionIndex = 0;
              quizCompleted = false;
            });
          },
          child: const Text('Restart Quiz'),
        ),
      ],
    );
  }

  void checkAnswer(String selectedAnswer) {
    setState(() {
      if (questionIndex < questionsWithAnswers.length - 1) {
        questionIndex++;
      } else {
        quizCompleted = true;
      }
    });
  }

  Widget answerButton({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

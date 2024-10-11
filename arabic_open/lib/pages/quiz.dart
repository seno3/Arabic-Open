// quiz_page.dart
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPage_State createState() => _QuizPage_State();
}

class _QuizPage_State extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0;

  // Sample quiz questions
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'ما هو جمع كلمة "كتاب"؟',
      'answers': [
        {'text': 'كتب', 'score': 1},
        {'text': 'كتابات', 'score': 0},
        {'text': 'كتابين', 'score': 0},
      ],
    },
    {
      'questionText': 'كيف تكتب "مرحبا" باللغة الإنجليزية؟',
      'answers': [
        {'text': 'Hello', 'score': 1},
        {'text': 'Hola', 'score': 0},
        {'text': 'Bonjour', 'score': 0},
      ],
    },
    {
      'questionText': 'ما هو مضاد كلمة "سهل"؟',
      'answers': [
        {'text': 'صعب', 'score': 1},
        {'text': 'سهلان', 'score': 0},
        {'text': 'مستحيل', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _score += score;

    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختبار اللغة العربية'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionText: _questions[_questionIndex]['questionText'] as String,
              answers: _questions[_questionIndex]['answers'] as List<Map<String, Object>>,
              answerQuestion: _answerQuestion,
            )
          : Result(
              score: _score,
              resetQuiz: _resetQuiz,
            ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String questionText;
  final List<Map<String, Object>> answers;
  final Function answerQuestion;

  Quiz({
    required this.questionText,
    required this.answers,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          questionText,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ...answers.map((answer) {
          return AnswerButton(
            answerText: answer['text'] as String,
            onPressed: () => answerQuestion(answer['score'] as int),
          );
        }).toList(),
      ],
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String answerText;
  final VoidCallback onPressed;

  AnswerButton({required this.answerText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: Text(
          answerText,
          style: TextStyle(fontSize: 18),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;

  Result({required this.score, required this.resetQuiz});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'لقد انتهيت!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'مجموع النقاط: $score',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('إعادة المحاولة'),
            onPressed: resetQuiz,
          ),
        ],
      ),
    );
  }
}

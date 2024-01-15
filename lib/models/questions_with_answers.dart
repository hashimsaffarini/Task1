// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionsWithAnswers {
  final String question;
  final List<String> answers;
  final String correctAnswer;
  QuestionsWithAnswers({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

List<QuestionsWithAnswers> questionsWithAnswers = [
  QuestionsWithAnswers(
    question: 'What\'s your favorite color?',
    answers: [
      'Black',
      'Red',
      'Green',
    ],
    correctAnswer: 'Red',
  ),
  QuestionsWithAnswers(
    question: 'What\'s your favorite animal?',
    answers: [
      'Rabbit',
      'Snake',
      'Elephant',
    ],
    correctAnswer: 'Elephant',
  ),
  QuestionsWithAnswers(
    question: 'Who\'s your favorite instructor?',
    answers: [
      'hashim',
      'tarek',
      'omar',
    ],
    correctAnswer: 'hashim',
  ),
];

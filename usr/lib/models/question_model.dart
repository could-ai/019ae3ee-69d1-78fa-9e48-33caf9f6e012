class Question {
  final String id;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  final String category;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    required this.category,
  });
}

class QuizCategory {
  final String id;
  final String name;
  final String iconPath; // We'll use IconData in the UI, but string for flexibility if we use assets later
  final String description;

  QuizCategory({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.description,
  });
}

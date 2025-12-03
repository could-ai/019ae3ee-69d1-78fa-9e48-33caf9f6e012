import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../models/question_model.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final QuizCategory category;

  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedOptionIndex;
  bool _isAnswered = false;

  @override
  void initState() {
    super.initState();
    _questions = QuizData.getQuestionsByCategory(widget.category.id);
  }

  void _answerQuestion(int selectedIndex) {
    if (_isAnswered) return;

    setState(() {
      _selectedOptionIndex = selectedIndex;
      _isAnswered = true;
      if (selectedIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = null;
        _isAnswered = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: _score,
            totalQuestions: _questions.length,
            categoryName: widget.category.name,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.category.name)),
        body: const Center(child: Text("No questions available for this category yet.")),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress Indicator
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _questions.length,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 8),
            Text(
              "Question ${_currentQuestionIndex + 1}/${_questions.length}",
              style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            
            // Question Text
            Text(
              currentQuestion.questionText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            
            // Options
            ...List.generate(currentQuestion.options.length, (index) {
              return _buildOptionCard(index, currentQuestion);
            }),
            
            const Spacer(),
            
            // Explanation (only if answered)
            if (_isAnswered)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Explanation:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    const SizedBox(height: 4),
                    Text(currentQuestion.explanation),
                  ],
                ),
              ),
            
            const SizedBox(height: 16),
            
            // Next Button
            if (_isAnswered)
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  _currentQuestionIndex == _questions.length - 1 ? "Finish Quiz" : "Next Question",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(int index, Question question) {
    Color borderColor = Colors.grey.shade300;
    Color backgroundColor = Colors.white;
    IconData? icon;

    if (_isAnswered) {
      if (index == question.correctAnswerIndex) {
        borderColor = Colors.green;
        backgroundColor = Colors.green.shade50;
        icon = Icons.check_circle;
      } else if (index == _selectedOptionIndex) {
        borderColor = Colors.red;
        backgroundColor = Colors.red.shade50;
        icon = Icons.cancel;
      }
    } else if (_selectedOptionIndex == index) {
      borderColor = Theme.of(context).colorScheme.primary;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () => _answerQuestion(index),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  question.options[index],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              if (icon != null) Icon(icon, color: borderColor),
            ],
          ),
        ),
      ),
    );
  }
}

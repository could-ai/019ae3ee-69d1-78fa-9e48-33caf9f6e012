import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String categoryName;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / totalQuestions) * 100;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                percentage >= 50 ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                size: 100,
                color: percentage >= 50 ? Colors.amber : Colors.grey,
              ),
              const SizedBox(height: 24),
              Text(
                categoryName,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                percentage >= 50 ? 'Congratulations!' : 'Keep Practicing!',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: [
                    Text(
                      '$score / $totalQuestions',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Text('Score', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to Home
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Back to Home', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

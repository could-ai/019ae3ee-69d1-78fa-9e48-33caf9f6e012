import '../models/question_model.dart';

class QuizData {
  static final List<QuizCategory> categories = [
    QuizCategory(
      id: 'gk_gs',
      name: 'GK & GS',
      iconPath: 'globe',
      description: 'General Knowledge and General Studies (History, Geography, Science)',
    ),
    QuizCategory(
      id: 'maths',
      name: 'Mathematics',
      iconPath: 'calculator',
      description: 'Quantitative Aptitude, Algebra, Arithmetic',
    ),
    QuizCategory(
      id: 'reasoning',
      name: 'Reasoning',
      iconPath: 'brain',
      description: 'Logical Reasoning, Direction Sense, Analogies',
    ),
    QuizCategory(
      id: 'cg_gk',
      name: 'Chhattisgarh GK',
      iconPath: 'map',
      description: 'Specific General Knowledge related to Chhattisgarh state',
    ),
    QuizCategory(
      id: 'upsc_special',
      name: 'UPSC Special',
      iconPath: 'book',
      description: 'High-level questions for Civil Services preparation',
    ),
  ];

  static final List<Question> questions = [
    // GK & GS
    Question(
      id: '1',
      questionText: 'Who was the first President of India?',
      options: ['Dr. Rajendra Prasad', 'Jawaharlal Nehru', 'Dr. B.R. Ambedkar', 'Indira Gandhi'],
      correctAnswerIndex: 0,
      explanation: 'Dr. Rajendra Prasad was the first President of India, serving from 1950 to 1962.',
      category: 'gk_gs',
    ),
    Question(
      id: '2',
      questionText: 'Which planet is known as the Red Planet?',
      options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      correctAnswerIndex: 1,
      explanation: 'Mars is often referred to as the "Red Planet" because the reddish iron oxide prevalent on its surface gives it a reddish appearance.',
      category: 'gk_gs',
    ),
    Question(
      id: '3',
      questionText: 'The Battle of Plassey was fought in which year?',
      options: ['1757', '1764', '1857', '1947'],
      correctAnswerIndex: 0,
      explanation: 'The Battle of Plassey was a decisive victory of the British East India Company over the Nawab of Bengal on 23 June 1757.',
      category: 'gk_gs',
    ),

    // Maths
    Question(
      id: '4',
      questionText: 'If a car travels 60 km in 1.5 hours, what is its average speed?',
      options: ['30 km/h', '40 km/h', '45 km/h', '50 km/h'],
      correctAnswerIndex: 1,
      explanation: 'Speed = Distance / Time = 60 km / 1.5 hrs = 40 km/h.',
      category: 'maths',
    ),
    Question(
      id: '5',
      questionText: 'What is 15% of 200?',
      options: ['20', '25', '30', '35'],
      correctAnswerIndex: 2,
      explanation: '15% of 200 = (15/100) * 200 = 15 * 2 = 30.',
      category: 'maths',
    ),

    // Reasoning (Direction)
    Question(
      id: '6',
      questionText: 'A man walks 5 km toward North, then turns right and walks 3 km. Then he turns right and walks 5 km. How far is he from the starting point?',
      options: ['3 km', '5 km', '8 km', '13 km'],
      correctAnswerIndex: 0,
      explanation: 'He walked North 5km, then East 3km, then South 5km. He is now at the same latitude as the start, but 3km East. So distance is 3km.',
      category: 'reasoning',
    ),
    Question(
      id: '7',
      questionText: 'Pointing to a photograph, a man said, "I have no brother or sister but that man’s father is my father’s son." Whose photograph was it?',
      options: ['His own', 'His son', 'His father', 'His nephew'],
      correctAnswerIndex: 1,
      explanation: 'Since he has no siblings, "my father\'s son" is the man himself. So, "that man\'s father is [me]". Therefore, the photograph is of his son.',
      category: 'reasoning',
    ),

    // CG GK
    Question(
      id: '8',
      questionText: 'Which is the capital city of Chhattisgarh?',
      options: ['Bilaspur', 'Raipur', 'Durg', 'Korba'],
      correctAnswerIndex: 1,
      explanation: 'Raipur is the capital city of the Indian state of Chhattisgarh.',
      category: 'cg_gk',
    ),
    Question(
      id: '9',
      questionText: 'The Chitrakote Falls is located on which river?',
      options: ['Mahanadi', 'Indravati', 'Shivnath', 'Hasdeo'],
      correctAnswerIndex: 1,
      explanation: 'Chitrakote Falls is a natural waterfall located to the west of Jagdalpur, in Bastar district, Chhattisgarh on the Indravati River.',
      category: 'cg_gk',
    ),

    // UPSC Special
    Question(
      id: '10',
      questionText: 'Which Schedule of the Indian Constitution contains provisions regarding the administration of Tribal Areas in the states of Assam, Meghalaya, Tripura and Mizoram?',
      options: ['Fifth Schedule', 'Sixth Schedule', 'Seventh Schedule', 'Eighth Schedule'],
      correctAnswerIndex: 1,
      explanation: 'The Sixth Schedule of the Constitution of India allows for the formation of Autonomous District Councils in Assam, Meghalaya, Tripura and Mizoram.',
      category: 'upsc_special',
    ),
  ];

  static List<Question> getQuestionsByCategory(String categoryId) {
    return questions.where((q) => q.category == categoryId).toList();
  }
}

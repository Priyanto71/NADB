import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C63FF)),
        useMaterial3: true,
        fontFamily: 'sans-serif',
      ),
      home: const SplashScreen(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DATA
// ─────────────────────────────────────────────────────────────────────────────

const List<Map<String, dynamic>> quizList = [
  {
    'title': 'Flutter Basics',
    'count': 10,
    'questions': [
      {
        'question': 'What is Flutter?',
        'options': ['Framework', 'Database', 'Language', 'IDE'],
        'answer': 'Framework',
      },
      {
        'question': 'Which language does Flutter use?',
        'options': ['Java', 'Kotlin', 'Dart', 'Swift'],
        'answer': 'Dart',
      },
      {
        'question': 'What is a Widget in Flutter?',
        'options': ['A database', 'A UI element', 'A server', 'A plugin'],
        'answer': 'A UI element',
      },
      {
        'question': 'Which widget is used for scrollable list?',
        'options': ['Column', 'Row', 'ListView', 'Stack'],
        'answer': 'ListView',
      },
      {
        'question': 'Hot reload in Flutter does what?',
        'options': [
          'Restarts the app',
          'Updates UI instantly',
          'Clears cache',
          'Rebuilds APK'
        ],
        'answer': 'Updates UI instantly',
      },
      {
        'question': 'Which company developed Flutter?',
        'options': ['Apple', 'Microsoft', 'Google', 'Facebook'],
        'answer': 'Google',
      },
      {
        'question': 'What is pubspec.yaml used for?',
        'options': [
          'UI design',
          'Managing dependencies',
          'Writing logic',
          'Database config'
        ],
        'answer': 'Managing dependencies',
      },
      {
        'question': 'Which widget centers its child?',
        'options': ['Align', 'Center', 'Padding', 'Container'],
        'answer': 'Center',
      },
      {
        'question': 'StatefulWidget holds?',
        'options': ['Static UI', 'Mutable state', 'Only text', 'Images'],
        'answer': 'Mutable state',
      },
      {
        'question': 'Which widget is used for navigation?',
        'options': ['Router', 'Navigator', 'Linker', 'PathFinder'],
        'answer': 'Navigator',
      },
    ],
  },
  {
    'title': 'General Knowledge',
    'count': 20,
    'questions': [
      {
        'question': 'What is the capital of France?',
        'options': ['Berlin', 'Madrid', 'Paris', 'Rome'],
        'answer': 'Paris',
      },
      {
        'question': 'How many continents are there?',
        'options': ['5', '6', '7', '8'],
        'answer': '7',
      },
      {
        'question': 'Which planet is closest to the Sun?',
        'options': ['Venus', 'Earth', 'Mercury', 'Mars'],
        'answer': 'Mercury',
      },
      {
        'question': 'What is H2O commonly known as?',
        'options': ['Salt', 'Water', 'Oxygen', 'Hydrogen'],
        'answer': 'Water',
      },
      {
        'question': 'Who painted the Mona Lisa?',
        'options': ['Picasso', 'Da Vinci', 'Van Gogh', 'Monet'],
        'answer': 'Da Vinci',
      },
      {
        'question': 'How many sides does a hexagon have?',
        'options': ['5', '6', '7', '8'],
        'answer': '6',
      },
      {
        'question': 'What is the largest ocean?',
        'options': ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
        'answer': 'Pacific',
      },
      {
        'question': 'Which gas do plants absorb?',
        'options': ['Oxygen', 'Nitrogen', 'CO2', 'Helium'],
        'answer': 'CO2',
      },
      {
        'question': 'Speed of light is approximately?',
        'options': [
          '300,000 km/s',
          '150,000 km/s',
          '500,000 km/s',
          '1,000 km/s'
        ],
        'answer': '300,000 km/s',
      },
      {
        'question': 'Which is the largest country by area?',
        'options': ['USA', 'China', 'Russia', 'Canada'],
        'answer': 'Russia',
      },
      {
        'question': 'What is the chemical symbol for Gold?',
        'options': ['Go', 'Gd', 'Au', 'Ag'],
        'answer': 'Au',
      },
      {
        'question': 'How many bones in an adult human body?',
        'options': ['186', '206', '226', '246'],
        'answer': '206',
      },
      {
        'question': 'Which is the tallest mountain?',
        'options': ['K2', 'Everest', 'Kangchenjunga', 'Lhotse'],
        'answer': 'Everest',
      },
      {
        'question': 'What does CPU stand for?',
        'options': [
          'Central Process Unit',
          'Central Processing Unit',
          'Computer Personal Unit',
          'Core Processing Unit'
        ],
        'answer': 'Central Processing Unit',
      },
      {
        'question': 'Which animal is the fastest on land?',
        'options': ['Lion', 'Horse', 'Cheetah', 'Leopard'],
        'answer': 'Cheetah',
      },
      {
        'question': 'What is the smallest prime number?',
        'options': ['0', '1', '2', '3'],
        'answer': '2',
      },
      {
        'question': 'How many colors in a rainbow?',
        'options': ['5', '6', '7', '8'],
        'answer': '7',
      },
      {
        'question': 'Who wrote Romeo and Juliet?',
        'options': ['Dickens', 'Shakespeare', 'Hemingway', 'Austen'],
        'answer': 'Shakespeare',
      },
      {
        'question': 'What is the powerhouse of the cell?',
        'options': ['Nucleus', 'Ribosome', 'Mitochondria', 'Vacuole'],
        'answer': 'Mitochondria',
      },
      {
        'question': 'Which country invented paper?',
        'options': ['India', 'Egypt', 'China', 'Greece'],
        'answer': 'China',
      },
    ],
  },
];

const List<String> categories = ['Science', 'Math', 'History', 'Sports'];

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 1 — Splash Screen
// ─────────────────────────────────────────────────────────────────────────────

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Quiz icon
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.quiz_rounded,
                color: Colors.white,
                size: 52,
              ),
            ),

            const SizedBox(height: 20),

            // App title
            const Text(
              'Quiz App',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 32),

            // Enter button
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizHomeScreen(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                'Enter',
                style: TextStyle(
                  color: Color(0xFF6C63FF),
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 2 — Quiz Home Screen
// ─────────────────────────────────────────────────────────────────────────────

class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen({super.key});

  void _showToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Hello World', textAlign: TextAlign.center),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color(0xFF6C63FF),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Quiz Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Choose Category title
            const Text(
              'Choose Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 12),

            // Category chips row
            Row(
              children: categories.map((cat) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Chip(
                    label: Text(cat),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
            ),

            const Divider(height: 32),

            // Quiz list
            Expanded(
              child: ListView.separated(
                itemCount: quizList.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final quiz = quizList[index];
                  return Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.black12),
                    ),
                    child: ListTile(
                      title: Text(
                        quiz['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        '${quiz['count']} Questions',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              quizTitle: quiz['title'],
                              questions: List<Map<String, dynamic>>.from(
                                  quiz['questions']),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bonus FAB — Hello World toast
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showToast(context),
        backgroundColor: const Color(0xFF6C63FF),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCREEN 3 — Quiz Screen
// ─────────────────────────────────────────────────────────────────────────────

class QuizScreen extends StatefulWidget {
  final String quizTitle;
  final List<Map<String, dynamic>> questions;

  const QuizScreen({
    super.key,
    required this.quizTitle,
    required this.questions,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  String? _selectedOption;

  void _goNext() {
    if (_currentIndex < widget.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
      });
    }
  }

  void _goPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _selectedOption = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentIndex];
    final List<String> options =
    List<String>.from(question['options'] as List);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Quiz',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question counter
            Text(
              'Question ${_currentIndex + 1}/${widget.questions.length}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 12),

            // Question text
            Text(
              question['question'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 28),

            // Options list
            Expanded(
              child: ListView.separated(
                itemCount: options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final option = options[index];
                  final isSelected = _selectedOption == option;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = option;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF6C63FF).withOpacity(0.08)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF6C63FF)
                              : Colors.black12,
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // Radio circle
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF6C63FF)
                                        : Colors.black38,
                                    width: 2,
                                  ),
                                  color: isSelected
                                      ? const Color(0xFF6C63FF)
                                      : Colors.white,
                                ),
                                child: isSelected
                                    ? const Icon(Icons.check,
                                    size: 14, color: Colors.white)
                                    : null,
                              ),
                              const SizedBox(width: 14),
                              Text(
                                option,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: isSelected
                                      ? const Color(0xFF6C63FF)
                                      : Colors.black87,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          // Info icon
                          Container(
                            width: 26,
                            height: 26,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black87,
                            ),
                            child: const Icon(Icons.info_outline,
                                size: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation buttons
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Previous button
            Expanded(
              child: OutlinedButton(
                onPressed: _currentIndex > 0 ? _goPrevious : null,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: _currentIndex > 0
                        ? const Color(0xFF6C63FF)
                        : Colors.black26,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'Previous',
                  style: TextStyle(
                    color: _currentIndex > 0
                        ? const Color(0xFF6C63FF)
                        : Colors.black38,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Next button
            Expanded(
              child: OutlinedButton(
                onPressed:
                _currentIndex < widget.questions.length - 1
                    ? _goNext
                    : null,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: _currentIndex < widget.questions.length - 1
                        ? const Color(0xFF6C63FF)
                        : Colors.black26,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: _currentIndex < widget.questions.length - 1
                        ? const Color(0xFF6C63FF)
                        : Colors.black38,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
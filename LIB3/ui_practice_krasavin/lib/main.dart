import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Практика 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PracticeScreen(),
    );
  }
}

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Практика 3'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text(
            'Добро пожаловать!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          
          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text(
              'Нажми меня',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          const SizedBox(height: 30),
          

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.star,
                color: Colors.blue,
                size: 40,
              ),
              SizedBox(width: 20),
              Icon(
                Icons.favorite,
                color: Color(0xFFFF6B9D),
                size: 40,
              ),
            ],
          ),
          
          const SizedBox(height: 30),
          
          Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFF9B59B6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Контейнер',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          

          const Text(
            'Текст с кастомным цветом',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFFE67E22),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_grid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final List<Exam> _exams;

  @override
  void initState() {
    super.initState();
    _exams = [
      Exam(
        subject: 'Структурно програмирање',
        dateTime: DateTime(2025, 12, 15, 14, 15),
        classrooms: ['Lab B', 'Lab 2'],
      ),
      Exam(
        subject: 'Објектно пррограмирање',
        dateTime: DateTime(2025, 11, 5, 14, 15),
        classrooms: ['Lab 13', 'Lab AB'],
      ),
      Exam(
        subject: 'Мобилни информациски системи',
        dateTime: DateTime(2025, 12, 17, 09, 15),
        classrooms: ['Lab 3', 'Lab 215'],
      ),
      Exam(
        subject: 'Оперативни системи',
        dateTime: DateTime(2025, 11, 1, 10, 30),
        classrooms: ['Lab 138', 'Lab 12'],
      ),
      Exam(
        subject: 'Алгоритми и податочни структури',
        dateTime: DateTime(2025, 12, 18, 11, 15),
        classrooms: ['Lab 138', 'Lab 2'],
      ),
      Exam(
        subject: 'Тимски проект',
        dateTime: DateTime(2024, 11, 12, 12, 45),
        classrooms: ['Lab 215', 'Lab 12'],
      ),
      Exam(
        subject: 'Архитектура и организација на компјутери',
        dateTime: DateTime(2025, 11, 02, 08, 30),
        classrooms: ['Lab AB', 'Lab 12'],
      ),
      Exam(
        subject: 'Дискретна математика',
        dateTime: DateTime(2025, 10, 20, 9, 0),
        classrooms: ['Lab 215', 'Lab 13'],
      ),
      Exam(
        subject: 'Интернет технологии',
        dateTime: DateTime(2025, 11, 26, 13, 15),
        classrooms: ['Lab 12', 'Lab 13'],
      ),
      Exam(
        subject: 'Веб програмирање',
        dateTime: DateTime(2025, 12, 26, 15, 40),
        classrooms: ['Lab 13', 'Lab 138'],
      ),
      Exam(
        subject: 'Бази на податоци',
        dateTime: DateTime(2025, 09, 20, 9, 0),
        classrooms: ['Lab 117', 'Lab 2'],
      ),
      Exam(
        subject: 'Вовед во наука за податоци',
        dateTime: DateTime(2025, 11, 11, 11, 15),
        classrooms: ['Lab 3', 'Lab 138'],
      ),
    ];

    // Подреди ги хронолошки по датум
    _exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              'ЛИСТА НА ПРЕДМЕТИ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ExamGrid(exams: _exams),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.pink.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Вкупно испити:',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.green.shade400,
              radius: 18,
              child: Text(
                _exams.length.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'exam_card.dart';

class ExamGrid extends StatefulWidget {
  final List<Exam> exams;

  const ExamGrid({super.key, required this.exams});

  @override
  State<StatefulWidget> createState() => _ExamGridState();
}

class _ExamGridState extends State<ExamGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.exams.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return ExamCard(exam: widget.exams[index]);
      },
    );
  }
}

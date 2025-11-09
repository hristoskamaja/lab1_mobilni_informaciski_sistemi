import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/details_info.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        title: const Text(
          'Распоред за испити - 223209',
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                exam.subject,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            DetailsInfo(exam: exam),
          ],
        ),
      ),
    );
  }
}

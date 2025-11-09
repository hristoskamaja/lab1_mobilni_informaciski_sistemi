import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';

class DetailsInfo extends StatelessWidget {
  final Exam exam;

  const DetailsInfo({super.key, required this.exam});

  String _timeUntilExam(DateTime examDate) {
    final now = DateTime.now();
    if (examDate.isBefore(now)) return "Испитот завршил";
    final diff = examDate.difference(now);
    return "${diff.inDays} дена, ${diff.inHours % 24} часа";
  }

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('dd.MM.yyyy');
    final timeFmt = DateFormat('HH:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.blueGrey, size: 22),
            const SizedBox(width: 10),
            Text(
              "Датум: ${dateFmt.format(exam.dateTime)}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            const Icon(Icons.access_time, color: Colors.blueGrey, size: 22),
            const SizedBox(width: 10),
            Text(
              "Време: ${timeFmt.format(exam.dateTime)}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: Colors.blueGrey, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "Простории: ${exam.classrooms.join(', ')}",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(thickness: 1.2),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.hourglass_bottom, color: Colors.orange, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "Преостанато време: ${_timeUntilExam(exam.dateTime)}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

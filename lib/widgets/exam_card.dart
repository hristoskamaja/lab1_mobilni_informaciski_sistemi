import 'package:flutter/material.dart';
import '../models/exam_model.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card(
        elevation: 3,
        color: isPast ? Colors.grey.shade300 : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.subject,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: isPast ? Colors.grey[600] : Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 15),
                  const SizedBox(width: 5),
                  Text(
                    "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}",
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 15),
                  const SizedBox(width: 5),
                  Text(
                    "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, size: 15),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      exam.classrooms.join(', '),
                      style: const TextStyle(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Icon(
                  isPast ? Icons.check_circle : Icons.schedule,
                  color: isPast ? Colors.green : Colors.orange,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

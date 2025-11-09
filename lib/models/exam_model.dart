class Exam {
  String subject;
  DateTime dateTime;
  List<String> classrooms;
  bool isPassed;

  Exam({
    required this.subject,
    required this.dateTime,
    required this.classrooms,
    this.isPassed = false,
  });
}

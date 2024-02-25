import 'package:login_api/model/task_type.dart';

class TaskModel {

  late String title, description, date, time;

  TaskType taskType;

  TaskModel(
      {required this.title,
      required this.description,
      required this.date,
      required this.time,
      required this.taskType});
}

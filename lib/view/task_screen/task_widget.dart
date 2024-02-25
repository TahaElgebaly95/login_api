import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/model/task_model.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_state.dart';
import '../../utils/font_style.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({required this.taskModel, super.key});

  TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      builder: (context, state) {
        var cubit = TaskCubit.get(context);
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          // width: 100,
          height: 140,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow.shade700, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(taskModel.title,
                        style: AppFontStyle.normalTextStyleLight),
                    Text(taskModel.description,
                        style: AppFontStyle.normalTextStyleLight),
                    Text(taskModel.date,
                        style: AppFontStyle.normalTextStyleLight),
                    Text(taskModel.time,
                        style: AppFontStyle.normalTextStyleLight),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.deleteTask();
                },
                icon: const Icon(Icons.done_all, size: 30),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.archive_outlined, size: 30),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_state.dart';

import '../../../utils/navigations.dart';


class CustomAddButton extends StatelessWidget {
  const CustomAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      builder: (context, state) {
        var cubit = TaskCubit.get(context);
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.yellow.shade700),
          onPressed: () {
            cubit.addTask();
          },
          child: const Text(
            'Add Task',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },
      listener: (context, state) {
        var cubit = TaskCubit.get(context);
        if (state is SuccessAddTaskState) {
          cubit.titleEditingController.clear();
          cubit.descriptionEditingController.clear();
          cubit.timeEditingController.clear();
          cubit.dateEditingController.clear();
          Navigation.pop(context);
        }
      },
    );
  }
}

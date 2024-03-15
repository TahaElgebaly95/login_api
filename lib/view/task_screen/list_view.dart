import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/view/task_screen/task_widget.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_state.dart';

class CustomListTasks extends StatelessWidget {
  const CustomListTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        var cubit = TaskCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) =>
                TaskWidget(oneTask: cubit.taskModel?.data?.tasks?[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: cubit.taskModel?.data?.tasks?.length ?? 0);
      },
    );
  }
}

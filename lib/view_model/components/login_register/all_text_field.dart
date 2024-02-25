import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/view_model/components/custom_textfield.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_state.dart';

import 'add_button.dart';

class AllTextFormFields extends StatelessWidget {
  const AllTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        var cubit = TaskCubit.get(context);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              prefixIcon: const Icon(Icons.title),
              onTap: () {},
              labelAndHint: 'Title',
              customEditingController: cubit.titleEditingController,
              validator: (value) {},
            ),
            const SizedBox(height: 12),
            CustomTextField(
              prefixIcon:const Icon(Icons.description),
              onTap: () {},
              labelAndHint: 'Description',
              customEditingController: cubit.descriptionEditingController,
              validator: (value) {},
            ),
            const SizedBox(height: 12),
            CustomTextField(
              prefixIcon:const Icon(Icons.date_range),
              onTap: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025))
                    .then((value) {
                  cubit.dateEditingController.text =
                      "${value!.year}-${value.month}-${value.day}";
                });
              },
              labelAndHint: 'date',
              customEditingController: cubit.dateEditingController,
              validator: (value) {},
            ),
            const SizedBox(height: 12),
            CustomTextField(
              prefixIcon:const Icon(Icons.access_time),
              onTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((value) {
                  cubit.timeEditingController.text =
                      "${value!.hour}-${value.minute}";
                });
              },
              labelAndHint: 'time',
              customEditingController: cubit.timeEditingController,
              validator: (value) {},
            ),
            const CustomAddButton()
          ],
        );
      },
    );
  }
}

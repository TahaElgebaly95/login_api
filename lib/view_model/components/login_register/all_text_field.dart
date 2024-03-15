import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:login_api/view_model/components/custom_textfield.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_state.dart';
import '../../../model/task_model.dart';
import 'add_button.dart';

class AllTextFormFields extends StatefulWidget {
  const AllTextFormFields({super.key});

  @override
  State<AllTextFormFields> createState() => _AllTextFormFieldsState();
}

class _AllTextFormFieldsState extends State<AllTextFormFields> {
  @override
  Widget build(BuildContext context) {
    Task? task;
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
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(height: 12),
            CustomTextField(
              prefixIcon: const Icon(Icons.description),
              onTap: () {},
              labelAndHint: 'Description',
              customEditingController: cubit.descriptionEditingController,
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(height: 12),
            CustomTextField(
              prefixIcon: const Icon(Icons.date_range),
              onTap: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025))
                    .then((value) {
                  cubit.dateEditingController.text =
                      DateFormat("yyyy-MM-dd").format(value!);
                });
              },
              labelAndHint: 'date',
              customEditingController: cubit.dateEditingController,
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(height: 12),
            CustomTextField(
              prefixIcon: const Icon(Icons.access_time),
              onTap: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025))
                    .then((value) {
                  cubit.timeEditingController.text =
                      DateFormat("yyyy-MM-dd").format(value!);
                });
              },
              labelAndHint: 'time',
              customEditingController: cubit.timeEditingController,
              validator: (value) {
                return null;
              },
            ),
            DropdownButton(
              value: task?.status,
              hint: Text(cubit.statusEditingController.text),
              items: const [
                DropdownMenuItem(
                  value: 'Tasks',
                  child: Text('Tasks'),
                ),
                DropdownMenuItem(
                  value: 'Done',
                  child: Text('Done'),
                ),
                DropdownMenuItem(
                  value: 'Archive',
                  child: Text('Archive'),
                ),
              ],
              onChanged: (value) {
                cubit.statusEditingController.text = value.toString();
                setState(() {});
              },
            ),
            const CustomAddButton()
          ],
        );
      },
    );
  }
}

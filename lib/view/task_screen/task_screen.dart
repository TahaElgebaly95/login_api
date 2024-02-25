import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_cubit.dart';
import 'package:login_api/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:login_api/view_model/cubit/theme_cubit/theme_state.dart';
import '../../view_model/components/task_components/tab_bar_custom.dart';
import '../../view_model/components/login_register/floating_button.dart';
import 'list_view.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     floatingActionButton: const CustomActionButton(),
      appBar: AppBar(
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              var cubit = ThemeCubit.get(context);
              return IconButton(
                  onPressed: () {
                    cubit.changeThemeCubit();
                  },
                  icon: cubit.isDark
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode));
            },
          ),
        ],
      ),
      body: BlocProvider.value(
        value: TaskCubit.get(context)..getTask(),
        child: TabBarCustom(
          tabs: const [
            Tab(text: 'Tasks'),
            Tab(text: 'Done'),
            Tab(text: 'Archive'),
          ],
          children: [
            const CustomListTasks(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade700, width: 2),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade700, width: 2),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/core/data/local/shared_helper.dart';
import 'package:login_api/core/data/local/shared_keys.dart';
import 'package:login_api/core/data/network/helper/dio_helper.dart';
import 'package:login_api/core/data/network/helper/endpoints.dart';
import 'package:login_api/model/task_model.dart';
import 'package:login_api/utils/show_toast.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_state.dart';

import '../../../utils/navigations.dart';
import '../../../view/auth_screen/login_screen.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(InitTask());

  static TaskCubit get(context) => BlocProvider.of(context);

  TaskModel? taskModel;

  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController dateEditingController = TextEditingController();
  TextEditingController timeEditingController = TextEditingController();
  TextEditingController statusEditingController = TextEditingController();

  void addTask() {
    emit(LoadingAddTaskState());
    Task task = Task(
        title: titleEditingController.text,
        description: descriptionEditingController.text,
        startDate: dateEditingController.text,
        endDate: timeEditingController.text,
        status: 'new');

    DioHelper.post(
      endpoint: EndPonits.tasks,
      withToken: true,
      body: task.toJson(),
    ).then((value) {
      print(value.data);
      Task addedTask = Task.fromJson(value.data['data']);
      taskModel?.data?.tasks?.add(addedTask);
      emit(SuccessAddTaskState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
      }
      emit(ErrorAddTaskState());
    });
  }

  Future<void> getTask() async {
    emit(LoadingGetTaskState());
    await DioHelper.getData(
      endpoint: EndPonits.tasks,
      withToken: true,
    ).then((value) {
      taskModel = TaskModel.fromJson(value.data);
      customShowToast(value.data['message'] ?? 'Error on Get All Tasks');
      print(value.data);
      emit(SuccessGetTaskState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
      }
      emit(ErrorGetTaskState());
    });
  }

  Future<void> deleteTask(int taskID) async {
    emit(LoadingDeleteTaskState());
    await DioHelper.delete(
      endpoint: "${EndPonits.tasks}/$taskID",
      withToken: true,
    ).then((value) {
      print(value.data);
      emit(SuccessDeleteTaskState());
      getTask();
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
        customShowToast(
            error.response?.data['message'] ?? 'Error on Delete Task');
        if (error.response?.data['message'] == 'Unauthorized' ||
            error.response?.statusCode == 401) {
          SharedHelper.remove(key: SharedKey.taskToken);
          Navigation.pushAndRemove(context, const LoginScreen());
        }
        emit(ErrorDeleteTaskState());
      }
    });
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/core/data/local/shared_helper.dart';
import 'package:login_api/core/data/local/shared_keys.dart';
import 'package:login_api/core/data/network/helper/dio_helper.dart';
import 'package:login_api/core/data/network/helper/endpoints.dart';
import 'package:login_api/model/task_model.dart';
import 'package:login_api/model/task_type.dart';
import 'package:login_api/view_model/cubit/task_cubit/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(InitTask());

  static TaskCubit get(context) => BlocProvider.of(context);

  List<TaskModel> taskList = [];

  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController dateEditingController = TextEditingController();
  TextEditingController timeEditingController = TextEditingController();

  void addTask() {
    emit(LoadingAddTaskState());
    taskList.add(TaskModel(
        taskType: TaskType.task,
        title: titleEditingController.text,
        description: descriptionEditingController.text,
        date: dateEditingController.text,
        time: timeEditingController.text));
    emit(SuccessAddTaskState());
  }

  Future<void> deleteTask() async {
    Response response = await DioHelper.delete(endpoint: EndPonits.tasks,);
    emit(LoadingDeleteTaskState());
    if (response.statusCode == 200) {
      SharedHelper.set(
          key: SharedKey.taskToken, value: response.data['data']['token']);
      print(response.data);
      emit(SuccessDeleteTaskState());
    }
  }

  Future<void> getTask() async {
    await DioHelper.getData(endpoint: EndPonits.tasks,withToken: true,).then((value) {
      print(value.data['data']);
      emit(SuccessGetTaskState());
    }).catchError((error){
      if (error is DioException){
        print(error.response?.data);
      }
      emit(ErrorGetTaskState(error));
    });
  }
}

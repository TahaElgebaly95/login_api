class TaskState {}

class InitTask extends TaskState {}

class LoadingAddTaskState extends TaskState {}

class ErrorAddTaskState extends TaskState {}

class SuccessAddTaskState extends TaskState {}

class LoadingDeleteTaskState extends TaskState {}

class ErrorDeleteTaskState extends TaskState {}

class SuccessDeleteTaskState extends TaskState {}

class LoadingGetTaskState extends TaskState {}

class ErrorGetTaskState extends TaskState {}

class SuccessGetTaskState extends TaskState {}

class TokenExpiredState extends TaskState {}

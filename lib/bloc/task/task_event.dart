part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final TaskModel task;

  AddTask({required this.task});
  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final TaskModel task;

  UpdateTask({required this.task});
  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final TaskModel task;

  DeleteTask({required this.task});
  @override
  List<Object> get props => [task];
}

class BinTask extends TaskEvent {
  final TaskModel task;

  BinTask({required this.task});
  @override
  List<Object> get props => [task];
}

class FavoriteTaskEvent extends TaskEvent {
  final TaskModel task;

  FavoriteTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class EditTaskEvent extends TaskEvent {
  final TaskModel oldtask;
  final TaskModel newtask;

  EditTaskEvent(this.oldtask, this.newtask);

  @override
  List<Object> get props => [oldtask, newtask];
}

class ReStroeEvent extends TaskEvent {
  final TaskModel task;

  ReStroeEvent(this.task);

  @override
  List<Object> get props => [task];
}

class DeleteAllEvent extends TaskEvent {}

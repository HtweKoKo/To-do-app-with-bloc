part of 'task_bloc.dart';

 class TaskState extends Equatable {
  final List<TaskModel> pendingTasks;
  final List<TaskModel> removeTasks;
  final List<TaskModel> completeTasks;
  // final List<TaskModel> favoriteTasks;

  

   const TaskState({
    this.pendingTasks =const <TaskModel>[],
    this.removeTasks =const <TaskModel>[],
    this.completeTasks =const <TaskModel>[],
    // this.favoriteTasks =const <TaskModel>[],
   });
  
  @override
  List<Object> get props => [pendingTasks,removeTasks,completeTasks];

  Map<String,dynamic> toMap(){
    return {
      "allTasks":pendingTasks.map((e) => e.toMap()).toList(),
      "removeTask":removeTasks.map((e) => e.toMap()).toList(),
      // "favoriteTasks":favoriteTasks.map((e) => e.toMap()).toList(),
      "completeTasks":completeTasks.map((e) => e.toMap()).toList(),
    };
  }
  factory TaskState.fromMap(Map map){
      return TaskState(
        pendingTasks: List.from(map["allTasks"].map((e)=> TaskModel.fromMap(e))),
        removeTasks: List.from(map["removeTask"].map((e)=> TaskModel.fromMap(e))),
        completeTasks: List.from(map["completeTasks"].map((e)=> TaskModel.fromMap(e))),
        // favoriteTasks: List.from(map["favoriteTasks"].map((e)=> TaskModel.fromMap(e))),
      );
  }
}

class TaskInitial extends TaskState {}

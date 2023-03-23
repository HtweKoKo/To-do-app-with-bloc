import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/taskModel.dart';
import 'package:bloc_project/pages/pendingPage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<AddTask>(_onAddEvent);
    on<UpdateTask>(_onUpdateEvent);
    on<DeleteTask>(_onDeleteEvent);
    on<BinTask>(_onBinEvent);
  //  on<FavoriteTaskEvent>(_onfavoriteTask);
    on<EditTaskEvent> (_onEditTask);
    on<ReStroeEvent>(_onRestoreEvent);
    on<DeleteAllEvent>(_deleteAllEvent);
  }
  void _onAddEvent(AddTask event, Emitter<TaskState> emit) {
    emit(
      TaskState(
          pendingTasks: List.from(state.pendingTasks)..add(event.task),
          removeTasks: state.removeTasks,
          completeTasks: state.completeTasks,
        //  favoriteTasks: state.favoriteTasks
          ),
    );
  }

  void _onUpdateEvent(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<TaskModel> pendingTask = state.pendingTasks;
    List<TaskModel> completeTasks = state.completeTasks;
    // List<TaskModel> favoriteTasks = state.favoriteTasks;
    
    task.isDone == false
        ? {
            pendingTask = List.from(pendingTask)..remove(task),
            completeTasks = List.from(completeTasks)
              ..insert(0, task.copyWith(isDone: true))
          }
        : {
            completeTasks = List.from(completeTasks)..remove(task),
            pendingTask = List.from(pendingTask)
              ..insert(0, task.copyWith(isDone: false)),
       

          };
    emit(TaskState(
        pendingTasks: pendingTask,
        completeTasks: completeTasks,
      // favoriteTasks: favoriteTasks,
        removeTasks: state.removeTasks));
  }

  void _onDeleteEvent(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    emit(TaskState(
        pendingTasks: state.pendingTasks,
        completeTasks: state.completeTasks,
        //  favoriteTasks: state.favoriteTasks,
        removeTasks: List.from(state.removeTasks)..remove(task)));
  }

  void _onBinEvent(BinTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completeTasks: List.from(state.completeTasks)..remove(event.task),
        // favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removeTasks: List.from(state.removeTasks)
          ..add(event.task.copyWith(isdeleted: true))));
  }

  // void _onfavoriteTask(FavoriteTaskEvent event, Emitter<TaskState> emit) {
  //   var state = this.state;
 
  //   List<TaskModel> pendingTasks = state.pendingTasks;
  //   List<TaskModel> completeTasks = state.completeTasks;
  //   // List<TaskModel> favoriteTasks = state.favoriteTasks;
  //   List<TaskModel> removeTasks = state.removeTasks;
  //   if(event.task.isFavorite == false){
  //             var index = pendingTasks.indexOf(event.task);
  //         pendingTasks = List.from(pendingTasks)..remove(event.task)
  //         ..insert(index
  //         , event.task.copyWith(isFavorite: true));
  //         // favoriteTasks.insert(0, event.task.copyWith(isFavorite: true) );
          
  //   }
  //   // else if(event.task.isDone == true && event.task.isFavorite == false){
  //   //           var index = completeTasks.indexOf(event.task);
  //   //         completeTasks = List.from(completeTasks)..remove(event.task)
  //   //         ..insert(index, event.task.copyWith(isFavorite: true));
  //   //         favoriteTasks. insert(0, event.task.copyWith(isFavorite: true));
  //   //         pendingTasks.remove(event.task);
             
  //   // }
  //   // else if(),
  //   else {
  //    pendingTasks = List.from(pendingTasks)..remove(event.task)
  //         ..insert(0, event.task.copyWith(isFavorite: false));
  //         favoriteTasks.insert(0, event.task.copyWith(isFavorite: false) );
  //   }
  //   // if (event.task.isDone == false) {
  //   //   if (event.task.isFavorite == false) {
  //   //     print("hello");
  //   //     var taskIndex = pendingTasks.indexOf(event.task);
  //   //     pendingTasks = List.from(pendingTasks)
  //   //       ..remove(event.task)
  //   //       ..insert(taskIndex, event.task.copyWith(isFavorite: true));
  //   //     favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
  //   //   } else{
  //   //     var taskIndexs = pendingTasks.indexOf(event.task);
  //   //     pendingTasks= List.from(pendingTasks)
  //   //       ..remove(event.task)
  //   //       ..insert(taskIndexs, event.task.copyWith(isFavorite: false));
  //   //     favoriteTasks.remove(event.task);
  //   //   }
  //   // } else {

  //   //   print("checked is true");
  //   //   if (event.task.isFavorite == false) {
  //   //     var taskIndex = completeTasks.indexOf(event.task);
  //   //     completeTasks = List.from(completeTasks)
  //   //       ..remove(event.task)
  //   //       ..insert(taskIndex, event.task.copyWith(isFavorite: true));
  //   //     favoriteTasks.insert(taskIndex, event.task.copyWith(isFavorite: true));
  //   //   } else {
  //   //     var taskIndex = completeTasks.indexOf(event.task);
  //   //     completeTasks = List.from(completeTasks)
  //   //       ..remove(event.task)
  //   //       ..insert(taskIndex, event.task.copyWith(isFavorite: false));
  //   //     favoriteTasks.remove(event.task);
  //   //   }
  //     emit(TaskState(
  //         pendingTasks: pendingTasks,
  //         completeTasks: completeTasks,
  //         favoriteTasks: favoriteTasks,
  //         removeTasks: removeTasks));
  //   // }
  // }
   
  void _onEditTask(EditTaskEvent event,Emitter<TaskState> emit){
      var state = this.state;
      var oldtask = event.oldtask;
      var newtask = event.newtask;
      // List<TaskModel> favoriteTask = state.favoriteTasks;
      // if(oldtask.isFavorite == true){
      //   favoriteTask..remove(oldtask)
      //   ..insert(0, oldtask);
      // }
      emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)
        ..remove(oldtask)..insert(0, newtask),
        removeTasks: state.removeTasks,
      // favoriteTasks: state.removeTasks,
        completeTasks: List.from(state.completeTasks)..remove(oldtask)
        ),
        
        
        );
    }
  
  void _deleteAllEvent(DeleteAllEvent event,Emitter<TaskState> emit){
    var state= this.state;
    var removeTask = state.removeTasks;
    removeTask = List.from(removeTask)..clear();
    emit(
      TaskState(
        pendingTasks: state.pendingTasks,
        removeTasks: removeTask,
      //  favoriteTasks: state.favoriteTasks,
        completeTasks: state.completeTasks
      )
    );
  }
  void _onRestoreEvent(ReStroeEvent event, Emitter<TaskState> emit){
    var state = this.state;
    var task = event.task;
    var removeTask = state.removeTasks;
    var pendingTask = state.pendingTasks;
    removeTask = List.from(removeTask)..remove(task);
    pendingTask = List.from(pendingTask)..insert(0,
    task.copyWith(
        isDone: false,
        isFavorite: false,
        isdeleted: false
    )
    );
    emit(TaskState(
      pendingTasks: pendingTask,
      removeTasks: removeTask,
      // favoriteTasks: state.favoriteTasks,
      completeTasks: state.completeTasks
    ));

  }
  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}

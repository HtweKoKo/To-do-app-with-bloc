import 'package:bloc_project/bloc/task/task_bloc.dart';
import 'package:bloc_project/data/taskModel.dart';
import 'package:bloc_project/pages/widget/addtask.dart';
import 'package:bloc_project/pages/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guid/flutter_guid.dart';

import 'widget/listWidget.dart';



class CompleteTasks extends StatefulWidget {
    static const id = "CompleteTasks";
  @override
  State<CompleteTasks> createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  TextEditingController _titleController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasks = state.completeTasks;
        return Scaffold(
         
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Center(child: Text("${tasks.length}task", style: TextStyle(fontSize: 20))),
              ListWidget(tasks: tasks)
            ]),
          ),
         
        );
        
      },
    );
    
  }

 
}

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



class PendingPage extends StatefulWidget {
    static const id = "PendingPage";
  @override
  State<PendingPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  TextEditingController _titleController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasks = state.pendingTasks;
        return Scaffold(
       
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Center(child: Text("${tasks.length} pending task | ${state.completeTasks.length} completed", style: TextStyle(fontSize: 18))),
              ListWidget(tasks: tasks)
            ]),
          ),
         
        );
        
      },
    );
    
  }

 
}

import 'package:bloc_project/bloc/task/task_bloc.dart';
import 'package:bloc_project/data/taskModel.dart';
import 'package:bloc_project/pages/widget/listWidget.dart';
import 'package:bloc_project/pages/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecycleBin extends StatefulWidget {
   static const id = "bin";
  const RecycleBin({Key? key}) : super(key: key);

  @override
  State<RecycleBin> createState() => _RecycleBinState();
}

class _RecycleBinState extends State<RecycleBin> {
  
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasks = state.removeTasks;
        return Scaffold(

          drawer: Mydrawer(),
          appBar: AppBar(
            actions: [
            PopupMenuButton(
      
      itemBuilder:   ((context) =>
      [
            PopupMenuItem(
                onTap: (){
                   context.read<TaskBloc>().add(DeleteAllEvent());
                },
              child: TextButton(
               child: Text("Delete all Data",style: TextStyle(color: Colors.black),),
                onPressed: null,
                
               ),
             
               ),
            ]))],
            title: Text("Bloc:Bin"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Center(child: Text("${tasks.length}task", style: TextStyle(fontSize: 20))),
              ListWidget(tasks:tasks)
            ]),
          ),
      
        );
        
      },
    );
    
  }
  
  }

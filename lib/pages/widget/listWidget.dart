
import 'package:bloc_project/bloc/task/task_bloc.dart';
import 'package:bloc_project/pages/widget/ListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/taskModel.dart';

class ListWidget extends StatelessWidget {


  const ListWidget({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
          children: tasks.map((task) => 
          ExpansionPanelRadio(
            value: task.id, 
            headerBuilder:(context,isExpanded){
               return listTileWidget(task, context);
            } , 
            body:Container(
              width: double.infinity,
               padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    Text(task.title),
    
                    SizedBox(height: 20,),
                    Text("Description:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    Text(task.description ),
                  ],
    
              ),
            ))
          
          ).toList(),
    
      ),
    );
}
}

// ListTile(
         
//             leading: SelectableText.rich(
//               TextSpan(
//                 children: [
//                   TextSpan(
//                    text: "Title\n" ,
//                    style: TextStyle(fontWeight: FontWeight.bold)
//                   ),
//                   TextSpan(text:task.title),
//                   TextSpan(
//                    text: "\ndescription\n" ,
//                    style: TextStyle(fontWeight: FontWeight.bold)
//                   ),
//                   TextSpan(text:task.description),

                 
//                 ]
          
//               )
//             ),
//           )

//  Expanded(
//       child: ListView.builder(
//         itemCount:tasks.length,
//         itemBuilder:(context,index){
//           var task = tasks[index];
         
//             return ListTile(
//               title:Text(task.title,
//               style: TextStyle(
//                 decoration: task.isDone!? TextDecoration.lineThrough:null)) ,
//               trailing: Checkbox(
//                 value: task.isDone,
                
//                  onChanged:(value){
//                  context.read<TaskBloc>().add(UpdateTask(task: task));
//                  }),
//                  onLongPress: () {
//                   removedOrDelete(context, task);
//                  },
//             );
//         } ),
//     );
//   }
import 'package:bloc_project/pages/editTask.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/task/task_bloc.dart';
import '../../data/taskModel.dart';

class PopupButton extends StatelessWidget {
  final TaskModel task;
  const PopupButton({Key? key,required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      
      itemBuilder: ((context) {
       
     if(task.isdeleted == true){
          return  [
          PopupMenuItem(
              onTap: (){
                context.read<TaskBloc>().add(ReStroeEvent(task));
              },
              child: TextButton.icon(
                icon: Icon(Icons.restore,color: Colors.black,),
                onPressed: null,
                label: Text("Restore",style: TextStyle(color: Colors.black)),
          )),
          PopupMenuItem(
            onTap: (){
              removedOrDelete(context, task);
            },
              child: TextButton.icon(
                icon: Icon(Icons.delete_forever,color: Colors.black,),
                onPressed: null,
                label: Text("Delete",style: TextStyle(color: Colors.black)),
                
          )),
      ];
        }
       else {
          return [
            PopupMenuItem(

              child: TextButton.icon(
                icon: Icon(Icons.edit,color: Colors.black,),
                onPressed: (){
                    Navigator.of(context).pop(context);
                     editTaskScreen(context);
                     },
                label: Text("Edit",style: TextStyle(color: Colors.black)),
               ),
             
               ),
            // PopupMenuItem(
            //   child: TextButton.icon(
            //     icon:task.isFavorite == false ? Icon(Icons.star_outline,color: Colors.black,):
            //     Icon(Icons.star,color: Colors.black,)
            //     ,
            //     onPressed: null,
            //     label:task.isFavorite == false? Text("Add to Favorite",style: TextStyle(color: Colors.black),):
            //      Text("remove from Favorite",style: TextStyle(color: Colors.black),)
            //     ,
            //    ),
            //    onTap: (){
            //       context.read<TaskBloc>().add(FavoriteTaskEvent(task: task));

            //    },
            //    ),

            PopupMenuItem(
              child: TextButton.icon(
                icon: Icon(Icons.delete,color: Colors.black,),
                onPressed: null,
                label: Text("Delete",style: TextStyle(color: Colors.black)),
               ),
               onTap: (){
                 removedOrDelete(context, task);
               },
               ),
               
        ];
        }
        
        }
        

      )
      // ):(context)=>[
      //     PopupMenuItem(
      //         onTap: (){
      //           context.read<TaskBloc>().add(ReStroeEvent(task));
      //         },
      //         child: TextButton.icon(
      //           icon: Icon(Icons.restore,color: Colors.black,),
      //           onPressed: null,
      //           label: Text("Restore",style: TextStyle(color: Colors.black)),
      //     )),
      //     PopupMenuItem(
      //       onTap: (){
      //         removedOrDelete(context, task);
      //       },
      //         child: TextButton.icon(
      //           icon: Icon(Icons.delete_forever,color: Colors.black,),
      //           onPressed: null,
      //           label: Text("Delete",style: TextStyle(color: Colors.black)),
                
      //     )),
      // ]
      ) ;
  }
  removedOrDelete(BuildContext context, TaskModel task) {
  task.isdeleted!
      ? context.read<TaskBloc>().add(DeleteTask(task: task))
      : context.read<TaskBloc>().add(BinTask(task: task));
}
void editTaskScreen(BuildContext context){
    showModalBottomSheet(
      context: context,
    isScrollControlled: true,
    builder: (context){
      return SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: EditTask(
                oldtask: task,
            
             )
          ),
        ),
      );
    });
  }

}
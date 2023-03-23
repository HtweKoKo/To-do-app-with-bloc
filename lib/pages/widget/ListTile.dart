import 'dart:ui';

import 'package:bloc_project/data/taskModel.dart';
import 'package:bloc_project/pages/favoriteTask.dart';
import 'package:bloc_project/pages/widget/popupButton.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/task/task_bloc.dart';

Widget listTileWidget(TaskModel task, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          // task.isFavorite == false?
          // Icon(Icons.star_outline):
          // Icon(Icons.star)

          // ,
           SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text(task.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null)),
              ),
             Text(DateFormat().add_yMMMd().add_Hms().format(DateTime.parse(task.date)))
            ],
          ),
        ],
      ),
      Checkbox(
          value: task.isDone,
          onChanged: (value) {
            context.read<TaskBloc>().add(UpdateTask(task: task));
          }),
      PopupButton(task:task)
    ],
  );
}



//   ListTile(
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
// }
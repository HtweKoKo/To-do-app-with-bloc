import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:intl/intl.dart';

import '../../bloc/task/task_bloc.dart';
import '../../data/taskModel.dart';

Widget addTaskWidget(
    {required TextEditingController titleController,
    required BuildContext context,
    required TextEditingController descriptionController}) {
  return Column(
    children: [
      Text(
        "Add Task",
        style: TextStyle(fontSize: 24),
      ),
      SizedBox(
        height: 20,
      ),
      TextFormField(
        autofocus: true,
        controller: titleController,
        decoration:
            InputDecoration(label: Text("task"), border: OutlineInputBorder()),
      ),
      SizedBox(height: 20,),
      TextFormField(
        autofocus: true,
        minLines: 3,
        maxLines: 6,
        controller: descriptionController,
        decoration:
            InputDecoration(label: Text("Description"),
             border: OutlineInputBorder()),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          TextButton(
              onPressed: () {
                var task = TaskModel(
                    date: DateTime.now().toString(),
                    description: descriptionController.text,
                    id: Guid.generate().value + 1.toString(),
                    title: titleController.text);
                context.read<TaskBloc>().add(AddTask(task: task));
                Navigator.pop(context);
                titleController.text = "";
                descriptionController.text = "";
              },
              child: Text("Add")),
        ],
      ),
    ],
  );
}

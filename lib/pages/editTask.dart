
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:intl/intl.dart';

import '../../bloc/task/task_bloc.dart';
import '../../data/taskModel.dart';
class EditTask extends StatelessWidget{
  final TaskModel oldtask;

  const EditTask({super.key, required this.oldtask});
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController(text: oldtask.title);
    TextEditingController _descriptionController = TextEditingController(text: oldtask.description);
 return Column(
    children: [
      Text(
        "Edit Task",
        style: TextStyle(fontSize: 24),
      ),
      SizedBox(
        height: 20,
      ),
      TextFormField(
        autofocus: true,
        controller: _titleController,
        decoration:
            InputDecoration(label: Text("task"), border: OutlineInputBorder()),
      ),
      SizedBox(height: 20,),
      TextFormField(
        autofocus: true,
        minLines: 3,
        maxLines: 6,
        controller: _descriptionController,
        decoration:
            InputDecoration(label: Text("task"),
             border: OutlineInputBorder()),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          TextButton(
              onPressed: () {
                var editTask = TaskModel(
                    isDone: false,
                    isFavorite: oldtask.isFavorite,
                    date: DateTime.now().toString(),
                    description: _descriptionController.text,
                    id: oldtask.id,
                    title: _titleController.text);
                context.read<TaskBloc>().add(EditTaskEvent(oldtask, editTask));
                Navigator.pop(context);
                _titleController.text = "";
                _descriptionController.text = "";
              },
              child: Text("Add")),
        ],
      ),
    ],
  );
  }

}



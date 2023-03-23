import 'package:bloc_project/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_project/bloc/task/task_bloc.dart';
import 'package:bloc_project/pages/RecycleBin.dart';
import 'package:bloc_project/pages/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(color: Colors.grey),
              child: Center(
                  child: Text(
                "My tasks",
                style: TextStyle(fontSize: 24),
              )),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(TabScreen.id);
              },
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return ListTile(
                    leading: Icon(Icons.file_copy),
                    title: Text("Task"),
                    trailing: Text("${state.pendingTasks.length}"),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(RecycleBin.id);
              },
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return ListTile(
                    leading: Icon(Icons.delete),
                    title: Text("Bin"),
                    trailing: Text('${state.removeTasks.length}'),
                  );
                },
              ),
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                          value:state.ischanged , 
                          onChanged: ((value) {
                            value ? context.read<SwitchBloc>().add(SwitchOnEvent()):
                            context.read<SwitchBloc>().add(SwitchOFFEvent());
                          }));
              },
            )
          ],
        ),
      ),
    );
  }
}

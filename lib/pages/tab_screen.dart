import 'package:bloc_project/data/taskModel.dart';
import 'package:bloc_project/pages/completeTask.dart';
import 'package:bloc_project/pages/favoriteTask.dart';
import 'package:bloc_project/pages/pendingPage.dart';
import 'package:bloc_project/pages/widget/addtask.dart';
import 'package:bloc_project/pages/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_guid/flutter_guid.dart';



class TabScreen extends StatefulWidget {
    static const String id = "tabScreen";
  
   
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
   final List<Map<String,dynamic>> pages = [
        {"pageName":PendingPage(),"title":"Pending Tasks"},
        {"pageName":CompleteTasks(),"title":"Completed Tasks"},
        // {"pageName":Favoritetasks(),"title":"Favorite Tasks"},
    ];
    int initialvalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[initialvalue]["title"])),
      drawer: const Mydrawer(),
      body:pages[initialvalue]["pageName"] ,
       floatingActionButton: initialvalue == 0? FloatingActionButton(
       onPressed:()=>addTaskScreen(context),
            child: const Text("+",style: TextStyle(fontSize: 20),),
             ):null,
             bottomNavigationBar: BottomNavigationBar(
              currentIndex: initialvalue,
              onTap: ((value) {
                setState(() {
                  initialvalue = value;
                });
              }),
              items: const [
                   BottomNavigationBarItem(
                    label: "Tasks",
                    icon: Icon(Icons.task)),
                   BottomNavigationBarItem(
                    label: "Complete",
                    icon: Icon(Icons.done)),
                  //  BottomNavigationBarItem(
                  //   label: "favorite",
                  //   icon: Icon(Icons.favorite)),

              ]),
    );
  }

   void addTaskScreen(BuildContext context,){
    showModalBottomSheet(
      context: context,
    isScrollControlled: true,
    builder: (context){
      return SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: addTaskWidget(
            descriptionController: _descriptionController,
            titleController: _titleController,
            context: context
            
             )
          ),
        ),
      );
    });
  }
}
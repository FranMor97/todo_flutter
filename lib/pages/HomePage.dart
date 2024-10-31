import 'package:flutter/material.dart';
import 'package:to_do/util/dialog_box.dart';
import 'package:to_do/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final TextEditingController _controller = TextEditingController();

  //List to do tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Make Tutorial", false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //method for save button
void saveNewTask(){}

  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return  DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: ()=> Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Pokemon To Do'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }


}
//Leer en casa widget en la api , State en la api tambien  los tipos de state y demas
//En el text conocer que es la elevation
//Leer ListView, que son las views en general

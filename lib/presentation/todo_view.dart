import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/domain/models/todo.dart';
import 'package:to_do_bloc/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),

          //add button
          TextButton(
            onPressed: () {
              todoCubit.addTodo(textController.text);
              Navigator.of(context).pop();
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

//BUID UI
  @override
  Widget build(BuildContext context) {
    //Todo Cubit
    final todoCubit = context.read<TodoCubit>();
    //Scafold
    return  Scaffold(
      //FAB
      floatingActionButton: FloatingActionButton(

        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoBox(context),
      ),
      //Block Builder
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              //get individual todo from todos list
              final todo = todos[index];
              //List Tile UI
              return ListTile(
                //Text
                title: Text(todo.text),

                //check box
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) => todoCubit.toggleCompletion(todo),
                ),
                //delete buttons
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => todoCubit.deleteTodo(todo),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

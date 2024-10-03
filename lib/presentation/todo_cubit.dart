/*
TO DO CUBIT
  simple state managment
  each cubit is a list of Todos
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/domain/models/todo.dart';
import 'package:to_do_bloc/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  //References todo repo
  final TodoRepo todoRepo;
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  //LOAD
  Future<void> loadTodos() async {
    //fetch list of todos
    final todoList = await todoRepo.getTodos();
    //emit todos
    emit(todoList);
  }

  //ADD
  Future<void> addTodo(String text) async {
    //creste a new todo with unique Id
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    //save a new todo to the repo
    await todoRepo.addTodo(newTodo);

    //refresh the list of todos

    loadTodos();
  }

  //DELETE
  Future<void> deleteTodo(Todo todo) async{
    //delete the provided todo from repos
    await todoRepo.deleteTodo(todo);

    //re-load
    loadTodos();
  }

  //TOGLLE
  Future<void> toggleCompletion(Todo todo) async{
    // togle the completion statues of  a provider todo
    final updatedTodo = todo.toggleCompletion();

    //update the new value of the todo
    await todoRepo.updateTodo(updatedTodo);

    //reload
    loadTodos();


  }
}

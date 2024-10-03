/*
To do repository
Here is what your app can do


 */

import '../models/todo.dart';

abstract class TodoRepo {
  //get list of Todo
  Future<List<Todo>> getTodos();

  //add a new todo
  Future<void> addTodo(Todo newTodo);

  //update a n exiting todo
  Future<void> updateTodo(Todo todo);

  //delete a todo
  Future<void> deleteTodo(Todo todo);
}

/*
  Notes:
    -the repo in the domain layer outlines what operations the app can do, but doesn't worry about the especific implementations details. Thats dfor the data layer
    -TECHNOLLOGY AGNOSTIC :INDEPENDENT OF SANY Technology or framework
 */

/*
DATABASE REPO
this implements the todo repo and handles storing, retrieving, updatinf, deleting in the datbase
 */
import 'package:isar/isar.dart';
import 'package:to_do_bloc/data/isar_todo.dart';
import 'package:to_do_bloc/domain/repository/todo_repo.dart';

import '../../domain/models/todo.dart';

class IsarTodoRepo implements TodoRepo {
  //database
  final Isar db;

  IsarTodoRepo(this.db);

  //get todos
  @override
  Future<List<Todo>> getTodos() async {
    // TODO: implement getTodos
    final todos = await db.todoIsars.where().findAll();

    //return as a list of todos and give the domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo newTodo) {
    // convert todo into Isar todo
    final todoIsar = TodoIsar.fromDomain(newTodo);

    //so that we can store it in pur db

    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> updateTodo(Todo todo) {
    // convert todo into Isar todo
    final todoIsar = TodoIsar.fromDomain(todo);

    //so that we can store it in pur db

    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}

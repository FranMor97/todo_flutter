import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_bloc/data/isar_todo.dart';
import 'package:to_do_bloc/data/repositories/isar_todo_repo.dart';
import 'package:to_do_bloc/presentation/todo_page.dart';

import 'domain/repository/todo_repo.dart';

//Buscar el uso de Future para las clases abstractas
//db en isar metodo writeTxn() y el put del todoIsar
//context aprender que es y como funciona
//Block Provider
//BuildContext funcionalidad
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //get directory path for storing data
  final dir = await getApplicationDocumentsDirectory();

  //open isar database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  //initalize the repo with isar database
  final isarTodoRepo = IsarTodoRepo(isar);
  //run app
  runApp(MyApp(todoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {
   final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo ),
    );
  }
}

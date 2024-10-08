/*
TO DO PAGE: responsible for providing cubit to view (UI)

-use BlocProvuder

 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/domain/repository/todo_repo.dart';
import 'package:to_do_bloc/presentation/todo_cubit.dart';
import 'package:to_do_bloc/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;

  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}

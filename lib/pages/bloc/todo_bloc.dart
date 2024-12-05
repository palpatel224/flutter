import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(tasks: [])) {
    on<AddTask>((event, emit) {
      final updatedTasks = List<String>.from(state.tasks)..add(event.element);
      return emit(state.copyWith(tasks: updatedTasks));
    });
    on<Remove>((event, emit) {
      final updatedTasks = List<String>.from(state.tasks)
        ..removeAt(event.index);
      return emit(state.copyWith(tasks: updatedTasks));
    });
  }
}

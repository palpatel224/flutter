part of 'todo_bloc.dart';

final class TodoState {
  List<String> tasks;
  TodoState({required this.tasks});

  TodoState  copyWith({ List<String>? tasks}){
    return TodoState(tasks: tasks ?? this.tasks);
  }
 }


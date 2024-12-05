part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class AddTask extends TodoEvent{
  final String element;
  AddTask({
    required this.element
  });
}

final class Remove extends TodoEvent{
  final int index;
  Remove({
    required this.index
  });
}

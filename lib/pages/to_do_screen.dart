import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/pages/bloc/todo_bloc.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List with BLoC'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a String',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final task = textEditingController.text.trim();
                    if (task.isNotEmpty) {
                      context
                          .read<TodoBloc>()
                          .add(AddTask(element: textEditingController.text));
                      textEditingController.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state.tasks.isEmpty) {
                  return const Center(
                    child: Text('Nothing added yet.'),
                  );
                }
                return ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () =>
                            context.read<TodoBloc>().add(Remove(index: index)),
                        child: Text(state.tasks[index]));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

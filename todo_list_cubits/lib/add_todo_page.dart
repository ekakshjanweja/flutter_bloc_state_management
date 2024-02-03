import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_cubits/cubit/todo_cubit.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoTitleController = TextEditingController();
  final todoDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: todoTitleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: todoDescriptionController,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<TodoCubit>().addTodo(
                        todoTitleController.text.trim(),
                        todoDescriptionController.text.trim(),
                      );
                  Navigator.of(context).pop();
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
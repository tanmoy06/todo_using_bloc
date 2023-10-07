import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/home_screen/bloc/todo_bloc.dart';
import 'package:todo_bloc/home_screen/bloc/todo_event.dart';
import 'package:todo_bloc/home_screen/bloc/todo_state.dart';

class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your Todo'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )),
                  ElevatedButton(
                    onPressed: () {
                      if (textEditingController.text.isNotEmpty) {
                        todoBloc.add(AddTodoEvent(textEditingController.text));
                        textEditingController.clear();
                      } else {
                        null;
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoBloc.todos.length,
                    itemBuilder: (context, index) {
                      if (state is TodoLoadedState) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              leading: Text(
                                (index + 1).toString(),
                                style: const TextStyle(fontSize: 15),
                              ),
                              title: Text(state.todos[index]),
                              trailing: IconButton(
                                  onPressed: () {
                                    todoBloc.add(
                                        DeleteTodoEvent(state.todos[index]));
                                  },
                                  icon: const Icon(Icons.delete)),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

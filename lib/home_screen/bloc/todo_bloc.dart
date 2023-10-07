import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/home_screen/bloc/todo_event.dart';
import 'package:todo_bloc/home_screen/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<String> todos = [];
  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
      if (event is AddTodoEvent) {
        todos.add(event.todo);
      } else if (event is DeleteTodoEvent) {
        todos.remove(event.todo);
      }
      emit(TodoLoadedState(List.from(todos)));
    });
  }
}

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoadedState extends TodoState {
  List<String> todos;
  TodoLoadedState(this.todos);
}

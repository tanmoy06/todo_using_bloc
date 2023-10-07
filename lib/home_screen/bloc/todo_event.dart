abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  String todo;
  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  String todo;
  DeleteTodoEvent(this.todo);
}

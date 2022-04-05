part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  
  TodoListState({
    required this.todos,
  });

  factory TodoListState.initial(){
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Item Item 1', ),
      Todo(id: '2', desc: 'Item Item 2', compeleted: true),
      Todo(id: '3', desc: 'Item Item 3'),
    ]);
  }


  @override
  List<Object> get props => [todos];

  

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  String toString() => 'TodoListState(todos: $todos)';
}



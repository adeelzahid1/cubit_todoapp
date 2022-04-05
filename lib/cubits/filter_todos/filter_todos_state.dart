part of 'filter_todos_cubit.dart';

class FilterTodosState extends Equatable {
   final List<Todo> filteredTodos;

  const FilterTodosState({required this.filteredTodos});

  factory FilterTodosState.initial(){
    return FilterTodosState(filteredTodos: []);
  }

  @override
  List<Object> get props => [];

  FilterTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilterTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  @override
  String toString() => 'FilterTodosState(filteredTodos: $filteredTodos)';
}



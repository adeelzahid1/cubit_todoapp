import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cubit_todoapp/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:cubit_todoapp/cubits/todo_list/todo_list_cubit.dart';
import 'package:cubit_todoapp/cubits/todo_search/todo_search_cubit.dart';
import 'package:cubit_todoapp/models/todo_model.dart';

part 'filter_todos_state.dart';

class FilterTodosCubit extends Cubit<FilterTodosState> {
  late StreamSubscription todoFilterSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoListSubscription;

  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;
  final List<Todo> initialTodos;

  FilterTodosCubit({
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
    required this.initialTodos,
    }) : super(FilterTodosState.initial()){

      todoFilterSubscription = todoFilterCubit.stream.listen((TodoFilterState todoFilterState) { setFilterTodos(); });
      todoSearchSubscription = todoSearchCubit.stream.listen((TodoSearchState todoSearchState) { setFilterTodos(); });
      todoListSubscription = todoListCubit.stream.listen((TodoListState todoListState) { setFilterTodos(); });
    }

    void setFilterTodos(){
      List<Todo> _filterTodos;
      switch(todoFilterCubit.state.filter){
        case Filter.active:
          _filterTodos = todoListCubit.state.todos.where((Todo todo) => !todo.completed).toList();
          break;
        case Filter.completed:
          _filterTodos = todoListCubit.state.todos.where((Todo todo) => todo.completed).toList();
          break;
        case Filter.all:
          _filterTodos = todoListCubit.state.todos;
          break;
        
      }

      if(todoSearchCubit.state.searchTerm.isNotEmpty){
        _filterTodos =  _filterTodos.where((Todo todo) => todo.desc.toLowerCase().contains(todoSearchCubit.state.searchTerm)).toList();
      }



    emit(state.copyWith(filteredTodos: _filterTodos));

    }
      @override
      Future<void> close() {
        todoFilterSubscription.cancel();
        todoSearchSubscription.cancel();
        todoListSubscription.cancel();
        return super.close();
  }

}








import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubit_todoapp/models/todo_model.dart';
import 'package:equatable/equatable.dart';

import 'package:cubit_todoapp/cubits/todo_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final TodoListCubit todoListCubit;
  late final StreamSubscription todoListSubscription;
  final int initialActiveTodoCount;

  ActiveTodoCountCubit(
    {required this.todoListCubit, required this.initialActiveTodoCount}
  ) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)){
      todoListSubscription = todoListCubit.stream.listen((TodoListState todoListState) {
        print('Todo List Listen .. ${todoListState}');

        final int currentActiveTodoCount = todoListState.todos.where((Todo todo) => !todo.completed).toList().length;
        emit(state.copyWith(activeTodoCount: currentActiveTodoCount));   
       });
  }


  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }

}

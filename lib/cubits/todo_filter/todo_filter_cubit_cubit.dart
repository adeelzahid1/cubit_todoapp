import 'package:bloc/bloc.dart';
import 'package:cubit_todoapp/models/todo_model.dart';
import 'package:equatable/equatable.dart';

part 'todo_filter_cubit_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());

void changeFilter(Filter newFilter){
  emit(state.copyWith(filter: newFilter));
  
}

}

import 'package:consumo_api/model/todo_model.dart';
import 'package:consumo_api/repository/todo_repository.dart';
import 'package:flutter/widgets.dart';

class MyAppController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  MyAppController([TodoRepository? repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodo();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }

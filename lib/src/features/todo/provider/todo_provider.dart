import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/src/features/todo/model/todo.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TodoStateNotifier extends StateNotifier<List<Todo>> {
  TodoStateNotifier([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add(String description) {
    state = [
      ...state,
      Todo(
        description: description,
        id: _uuid.v4()
      ),
    ];

  }

  void edit({required String id, required String description}) {
    state = [
      for(final todo in state)
        if(todo.id == id)
          Todo(
            description: description,
            id: todo.id,
            completed: todo.completed
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }

  void toggle(String id) {
    state = [
      for(final todo in state)
        if(id == todo.id)
          Todo(
            description: todo.description,
            id: todo.id,
            completed: !todo.completed
          )
        else
          todo
    ];
  }
}

final todoStateNotifierProvider = StateNotifierProvider<TodoStateNotifier, List<Todo>>((ref) {
  return TodoStateNotifier();
});

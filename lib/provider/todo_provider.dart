
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/Todo.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TodoStateNotifier extends StateNotifier<List<Todo>> {
  TodoStateNotifier() : super([]);

  add(String description) {
    state = [
      ...state,
      Todo(
        description: description,
        id: _uuid.v4()
      ),
    ];

  }

  edit(String id, String description) {
    state = [
      ...state,
      for(final todo in state)
        if(todo.id == id)
          Todo(
            description: todo.description,
            id: todo.id,
          )
    ];

  }

  remove() {

  }

  toggle(String id) {
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

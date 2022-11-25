import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:river_pod/src/helper/typedef.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    required String description,
    required String id,
    @Default(false) bool completed,
  }) = _Todo;

  factory Todo.fromJson(JSON json) => _$TodoFromJson(json);
}

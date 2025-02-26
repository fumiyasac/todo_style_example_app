import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_style_example_app/repository/todo_repository.dart';

final todoProvider = NotifierProvider<TodoRepositoryNotifier, TodoRepository>(TodoRepositoryNotifier.new);
class TodoRepositoryNotifier extends Notifier<TodoRepository> {
  @override
  TodoRepository build() => TodoRepository();
}

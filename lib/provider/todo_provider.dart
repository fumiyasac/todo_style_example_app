import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_style_example_app/model/todo_model.dart';
import 'package:todo_style_example_app/repository/todo_repository.dart';

final todoProvider = StateProvider<TodoRepository>((ref) {
  return TodoRepository();
});

final fetchStreamTodoProvider = StreamProvider<List<TodoModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
    .collection('todoApp')
    .snapshots()
    .map((event) =>
      event.docs.map((snapshot) => TodoModel.fromSnapshot(snapshot)).toList()
    );
  yield* getData;
});

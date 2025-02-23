import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_style_example_app/model/todo_model.dart';

class TodoRepository {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }
}
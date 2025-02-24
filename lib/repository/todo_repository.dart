import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_style_example_app/model/todo_model.dart';

class TodoRepository {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

  // MEMO: Todoリポジトリに集約する場合はこの様な感じになる。
  // Stream<List<TodoModel>> fetchTasks() {
  //   return todoCollection.snapshots()
  //     .map((event) =>
  //       event.docs.map((snapshot) => TodoModel.fromSnapshot(snapshot)).toList()
  //     );
  // }

  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }

  void updateTask(String? docID, bool? valueUpdate) {
    todoCollection.doc(docID).update({
      'isDone': valueUpdate,
    });
  }

  void deleteTask(String? docID) {
    todoCollection.doc(docID).delete();
  }
}
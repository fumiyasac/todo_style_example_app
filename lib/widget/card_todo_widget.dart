import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_style_example_app/model/todo_model.dart';

class CardTodoWidget extends StatelessWidget {
  const CardTodoWidget({
    super.key,
    required this.todoModel,
    required this.onDeleteButtonPressed,
    required this.onDoneStatusChenge,
  });

  final TodoModel todoModel;
  final VoidCallback onDeleteButtonPressed;
  final void Function(bool) onDoneStatusChenge;

  @override
  Widget build(BuildContext context) {
    Color categoryColor = Colors.white;
    final getCategory = todoModel.category;
    switch (getCategory) {
      case 'Learning':
        categoryColor = Colors.green;
        break;
      case 'Working':
        categoryColor = Colors.blue.shade700;
        break;
      case 'General':
        categoryColor = Colors.amber.shade700;
        break;
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: categoryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => onDeleteButtonPressed(),
                    ),
                    title: Text(todoModel.titleTask,
                      maxLines: 1,
                      style: TextStyle(
                        decoration: todoModel.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    subtitle: Text(todoModel.description,
                      maxLines: 1,
                      style: TextStyle(
                        decoration: todoModel.isDone ? TextDecoration.lineThrough : null,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: Colors.blue.shade800,
                        shape: CircleBorder(),
                        value: todoModel.isDone,
                        onChanged: (value) => (value != null) ? onDoneStatusChenge(value) : null,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -12),
                    child: Container(
                      child: Column(
                        children: [
                          Divider(
                            thickness: 1.5,
                            color: Colors.grey.shade200,
                          ),
                          Row(
                            children: [
                              Text(todoModel.dateTask),
                              Gap(12),
                              Text(todoModel.timeTask),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

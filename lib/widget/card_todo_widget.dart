import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_style_example_app/provider/todo_provider.dart';

class CardTodoWidget extends ConsumerWidget {
  const CardTodoWidget({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color categoryColor = Colors.white;
    final todoData = ref.watch(fetchStreamTodoProvider);
    return todoData.when(
      data: (todoData) {
        final getCategory = todoData[getIndex].category;
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
                          onPressed: () => ref.read(todoProvider).deleteTask(todoData[getIndex].docID),
                        ),
                        title: Text(todoData[getIndex].titleTask,
                          maxLines: 1,
                          style: TextStyle(
                            decoration: todoData[getIndex].isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        subtitle: Text(todoData[getIndex].description,
                          maxLines: 1,
                          style: TextStyle(
                            decoration: todoData[getIndex].isDone ? TextDecoration.lineThrough : null,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            activeColor: Colors.blue.shade800,
                            shape: CircleBorder(),
                            value: todoData[getIndex].isDone,
                            onChanged: (value) => ref.read(todoProvider)
                              .updateTask(todoData[getIndex].docID, value),
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
                                  Text(todoData[getIndex].dateTask),
                                  Gap(12),
                                  Text(todoData[getIndex].timeTask),
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
      },
      error: (error, stackTrace) => Center(
        child: Text(stackTrace.toString()),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

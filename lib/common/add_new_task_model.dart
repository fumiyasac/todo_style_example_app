import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_style_example_app/constants/app_style.dart';
import 'package:todo_style_example_app/model/todo_model.dart';
import 'package:todo_style_example_app/widget/text_field_widget.dart';
import 'package:todo_style_example_app/widget/date_time_widget.dart';
import 'package:todo_style_example_app/widget/radio_widget.dart';
import 'package:todo_style_example_app/provider/date_time_provider.dart';
import 'package:todo_style_example_app/provider/radio_provider.dart';
import 'package:todo_style_example_app/provider/todo_provider.dart';

class AddNewTaskModel extends ConsumerStatefulWidget {
  const AddNewTaskModel({super.key});

  @override
  AddNewTaskModelState createState() => AddNewTaskModelState();
}

class AddNewTaskModelState extends ConsumerState<AddNewTaskModel> {

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final todo = ref.watch(todoProvider);
    final radio = ref.watch(radioProvider);

    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.73,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "New Task Todo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),
          Gap(12),
          Text(
            "Title Task",
            style: AppStyle.headingOne,
          ),
          Gap(6),
          TextFieldWidget(
            hintText: "Add Task Name",
            maxLines: 1,
            textEditingController: titleController,
          ),
          Gap(12),
          Text(
            "Description",
            style: AppStyle.headingOne,
          ),
          Gap(6),
          TextFieldWidget(
            hintText: "Add Descriptions",
            maxLines: 5,
            textEditingController: descriptionController,
          ),
          Gap(12),
          Text(
            "Category",
            style: AppStyle.headingOne,
          ),
          Row(
            children: [
              Expanded(
                child: RadioWidget(
                  titleRadio: "LRN",
                  categoryColor: Colors.green,
                  valueInput: 1,
                  onChangeValue: () => ref.read(radioProvider.notifier).update(1),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: "WRK",
                  categoryColor: Colors.blue.shade700,
                  valueInput: 2,
                  onChangeValue: () => ref.read(radioProvider.notifier).update(2),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: "GEN",
                  categoryColor: Colors.amberAccent.shade700,
                  valueInput: 3,
                  onChangeValue: () => ref.read(radioProvider.notifier).update(3),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: 'Date',
                valueText: date,
                iconSection: Icons.calendar_month,
                onTap: () async {
                  final getDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030)
                  );
                  if (getDate != null) {
                    final format = DateFormat.yMd();
                    ref
                      .read(dateProvider.notifier)
                      .update(format.format(getDate));
                  }
                },
              ),
              Gap(22),
              DateTimeWidget(
                titleText: 'Time',
                valueText: time,
                iconSection: Icons.watch_later_outlined,
                onTap: () async {
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (getTime != null) {
                      ref
                        .read(timeProvider.notifier)
                        .update(getTime.format(context));
                  }
                }
              ),
            ],
          ),
          Gap(12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: Colors.blue.shade800
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ),
              Gap(20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                        color: Colors.blue.shade800
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {
                    String category = '';
                    switch (radio) {
                      case 1:
                        category = 'Learning';
                        break;
                      case 2:
                        category = 'Working';
                        break;
                      case 3:
                        category = 'General';
                        break;
                    }

                    todo.addNewTask(
                      TodoModel(
                        titleTask: titleController.text,
                        description: descriptionController.text,
                        category: category,
                        dateTask: date,
                        timeTask: time,
                        isDone: false,
                      )
                    );
                    ref.read(radioProvider.notifier).update(0);
                    ref.read(dateProvider.notifier).update("dd/mm/yy");
                    ref.read(timeProvider.notifier).update("hh : mm");
                    Navigator.pop(context);
                  },
                  child: Text('Create'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
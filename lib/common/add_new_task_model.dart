import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_style_example_app/constants/app_style.dart';
import 'package:todo_style_example_app/provider/radio_provider.dart';
import 'package:todo_style_example_app/widget/text_field_widget.dart';
import 'package:todo_style_example_app/widget/date_time_widget.dart';
import 'package:todo_style_example_app/widget/radio_widget.dart';
import 'package:todo_style_example_app/provider/date_time_provider.dart';

class AddNewTaskModel extends ConsumerWidget {
  const AddNewTaskModel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);

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
          const Gap(12),
          Text(
            "Title Task",
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          TextFieldWidget(hintText: "Add Task Name", maxLines: 1),
          const Gap(12),
          Text(
            "Description",
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          TextFieldWidget(hintText: "Add Descriptions", maxLines: 5),
          const Gap(12),
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
                  onChangeValue: () => ref.read(radioProvider.notifier).update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: "WRK",
                  categoryColor: Colors.blue.shade700,
                  valueInput: 2,
                  onChangeValue: () => ref.read(radioProvider.notifier).update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: "GEN",
                  categoryColor: Colors.amberAccent.shade700,
                  valueInput: 3,
                  onChangeValue: () => ref.read(radioProvider.notifier).update((state) => 3),
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
                      .update((state) => format.format(getDate));
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
                        .update((state) => getTime.format(context));
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
                  onPressed: () {},
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
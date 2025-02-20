import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_style_example_app/constants/app_style.dart';
import 'package:todo_style_example_app/widget/text_field_widget.dart';

import '../widget/date_time_widget.dart';
import '../widget/radio_widget.dart';

class AddNewTaskModel extends StatelessWidget {
  const AddNewTaskModel({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: RadioWidget(titleRadio: "LRN", categoryColor: Colors.green)
              ),
              Expanded(
                  child: RadioWidget(titleRadio: "WRK", categoryColor: Colors.blue.shade700)
              ),
              Expanded(
                  child: RadioWidget(titleRadio: "GEN", categoryColor: Colors.amberAccent.shade700)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(titleText: 'Date', valueText: 'dd/mm/yy', iconSection: Icons.calendar_month),
              Gap(22),
              DateTimeWidget(titleText: 'Time', valueText: 'hh : mm', iconSection: Icons.watch_later_outlined),
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
                  onPressed: () {},
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
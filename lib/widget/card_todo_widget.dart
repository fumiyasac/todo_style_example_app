import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardTodoWidget extends StatelessWidget {
  const CardTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: Colors.green,
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
                    title: Text('Learning Web Developer'),
                    subtitle: Text('Learning topic HTML and CSS'),
                    trailing: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: Colors.blue.shade800,
                        shape: CircleBorder(),
                        value: true,
                        onChanged: (value) => print(value),
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
                              Text('Today'),
                              Gap(12),
                              Text('09:15 PM - 11:45 PM'),
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

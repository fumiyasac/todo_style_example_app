import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_style_example_app/provider/radio_provider.dart';

class RadioWidget extends ConsumerWidget {
  const RadioWidget({
    super.key,
    required this.titleRadio,
    required this.categoryColor,
    required this.valueInput,
    required this.onChangeValue,
  });

  final String titleRadio;
  final Color categoryColor;
  final int valueInput;
  final VoidCallback onChangeValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: categoryColor,
      ),
      child: RadioListTile(
        activeColor: categoryColor,
        contentPadding: EdgeInsets.zero,
        title: Transform.translate(
          offset: Offset(-22, 0),
          child: Text(titleRadio,
            style: TextStyle(
              color: categoryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        value: valueInput,
        groupValue: radio,
        onChanged: (value) => onChangeValue(),
      ),
    );
  }
}

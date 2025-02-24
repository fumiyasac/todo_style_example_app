import 'package:flutter_riverpod/flutter_riverpod.dart';

final radioProvider = NotifierProvider<RadioNotifier, int>(RadioNotifier.new);
class RadioNotifier extends Notifier<int> {
  @override
  int build() => 0;
  void update(int radioValue) {
    state = radioValue;
  }
}

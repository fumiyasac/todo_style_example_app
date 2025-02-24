import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = NotifierProvider<DateNotifier, String>(DateNotifier.new);
class DateNotifier extends Notifier<String> {
  @override
  String build() => "dd/mm/yy";
  void update(String dateValue) {
    state = dateValue;
  }
}

final timeProvider = NotifierProvider<TimeNotifier, String>(TimeNotifier.new);
class TimeNotifier extends Notifier<String> {
  @override
  String build() => "hh : mm";
  void update(String timeValue) {
    state = timeValue;
  }
}


import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StreamProvider((ref) {
  return Stream.periodic(
    Duration(seconds: 1),
        (count) => count,
  );
});
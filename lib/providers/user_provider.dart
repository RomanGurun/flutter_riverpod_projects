import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = FutureProvider<Map>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return {
    'name': 'John Doe',
    'email': 'john@example.com',
    'age': 30,
  };
});

final userByIdProvider = FutureProvider.family(
      (ref, userId) async {
    await Future.delayed(Duration(seconds: 1));
    return 'User data for ID: $userId';
  },
);
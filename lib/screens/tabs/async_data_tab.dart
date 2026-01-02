import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/user_provider.dart';
import '../../providers/timer_provider.dart';

class AsyncDataTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    final timer = ref.watch(timerProvider);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FutureProvider Example',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          userData.when(
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'),
            data: (data) => Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${data['name']}'),
                    Text('Email: ${data['email']}'),
                    Text('Age: ${data['age']}'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'StreamProvider Example',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          timer.when(
            loading: () => Text('Waiting for timer...'),
            error: (err, stack) => Text('Error: $err'),
            data: (count) => Text(
              'Timer: $count seconds',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/screens/tabs/simple_state_tab.dart';
import 'package:login/screens/tabs/async_data_tab.dart';
import 'package:login/screens/tabs/todo_list_tab.dart';
import 'package:login/screens/tabs/cart_tab.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Riverpod 2.0 Examples'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Simple State'),
              Tab(text: 'Async Data'),
              Tab(text: 'Todo List'),
              Tab(text: 'Cart'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SimpleStateTab(),
            AsyncDataTab(),
            TodoListTab(),
            CartTab(),
          ],
        ),
      ),
    );
  }
}
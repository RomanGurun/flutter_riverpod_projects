import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/home_page.dart';
import 'cart_notifier.dart';

final cartProvider = ChangeNotifierProvider((ref) {
  return CartNotifier();
});

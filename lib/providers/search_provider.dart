import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider.autoDispose((ref) {
  return '';
});

final searchResultsProvider = FutureProvider.autoDispose<List>(
      (ref) async {
    final query = ref.watch(searchQueryProvider);
    await Future.delayed(Duration(milliseconds: 500));

    if (query.isEmpty) return [];

    return [
      'Result 1 for $query',
      'Result 2 for $query',
      'Result 3 for $query'
    ];
  },
);

final productByIdProvider = FutureProvider.autoDispose.family(
      (ref, productId) async {
    await Future.delayed(Duration(seconds: 1));
    return 'Product details for ID: $productId';
  },
);
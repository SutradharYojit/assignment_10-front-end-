import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/product_model.dart';
import '../../../services/api_constants.dart';
import '../../../services/services.dart';

final cartList = StateNotifierProvider<CartList, List<ProductList>>((ref) => CartList());

class CartList extends StateNotifier<List<ProductList>> {
  CartList() : super([]);
  int items = 0;
  double total = 0;

  void addToCartList(ProductList item) {
    state.add(item);
    state = [...state];
  }

  void cartTotal() {
    items = state.length;
    double sum = 0;
    for (int i = 0; i < items; i++) {
      sum += state[i].price!;
    }
    total = sum;
  }
}

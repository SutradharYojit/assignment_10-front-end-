import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/product_model.dart';
import '../../../services/api_constants.dart';
import '../../../services/services.dart';

final productList = StateNotifierProvider<ItemList, List<ProductList>>((ref) => ItemList());

class ItemList extends StateNotifier<List<ProductList>> {

  ItemList() : super([]);
  bool loading = true;

  Future<void> fetchProductItem() async {
    state.clear();
    var data = await ApiServices().getApi(api: "${APIConstants.baseUrl}product/getProduct");
    for (Map<String, dynamic> i in data) {
      //add all the data to blogData List
      state.add(ProductList.fromJson(i));
    }
    loading = false;
    log(state[0].title.toString());
    state = [...state];
  }
}

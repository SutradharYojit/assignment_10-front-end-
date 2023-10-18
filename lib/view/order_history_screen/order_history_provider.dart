import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/api_constants.dart';
import '../../../services/services.dart';
import '../../model/model.dart';

final orderHistory = StateNotifierProvider<OrderHistory, List<CartModel>>((ref) => OrderHistory());

class OrderHistory extends StateNotifier<List<CartModel>> {

  OrderHistory() : super([]);
  bool loading = true;

  Future<void> userOrderHistory() async {
    state.clear();
    var order = await ApiServices().postApi(api: "${APIConstants.baseUrl}cart/getproductHistory",data: {
      "userId":UserPreferences.uid
    });
    for (Map<String, dynamic> i in order["data"]) {
      //add all the data to blogData List
      state.add(CartModel.fromJson(i));
    }
    loading = false;
    // log(state[0].productList![0].price.toString());
    log(state[0].quantity.toString());
    state = [...state];
  }
}

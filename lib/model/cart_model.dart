// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

import 'product_model.dart';

List<CartModel> temperaturesFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String temperaturesToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  int? quantity;
  double? amount;
  String? userId;
  List<ProductList> ?productList;

  CartModel({
    this.quantity,
    this.amount,
    this.userId,
    this.productList,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    quantity: json["quantity"],
    amount: json["Amount"].toDouble(),
    userId: json["userId"],
    productList: List<ProductList>.from(json["productList"].map((x) => ProductList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "Amount": amount,
    "userId": userId,
    "productList": List<dynamic>.from(productList!.map((x) => x.toJson())),
  };
}



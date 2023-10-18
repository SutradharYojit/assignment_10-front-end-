import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:assignement_10/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/model.dart';
import '../../resources/resources.dart';
import '../../services/api_constants.dart';
import '../../widget/widget.dart';
import 'cart_list_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final cartItem = ref.watch(cartList);
                  return Expanded(
                    child: ListView.builder(
                      itemCount: cartItem.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12).w,
                            height: 97.h,
                            decoration: BoxDecoration(
                                color: ColorManager.rgbWhiteColor, borderRadius: BorderRadius.circular(20).w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10).r,
                                      child: Container(
                                        height: double.infinity,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(cartItem[index].imageUrl!),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(15).w),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItem[index].title!,
                                          style: const TextStyle(fontSize: 17, color: ColorManager.blackColor),
                                        ),
                                        Text(
                                          cartItem[index].brand!,
                                          style: const TextStyle(fontSize: 12, color: ColorManager.greyColor),
                                        ),
                                        Text(
                                          "₹ ${cartItem[index].price!.toString()}",
                                          style: TextStyle(fontSize: 12.sp, color: ColorManager.blackColor),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  ref.watch(cartList.notifier).cartTotal();
                  final totalItem = ref.read(cartList.notifier).items;
                  final totalAmount = ref.read(cartList.notifier).total;
                  final productDetails = ref.read(cartList);
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total ($totalItem item)",
                            style: TextStyle(
                              fontSize: 15,
                              color: ColorManager.grey400Color,
                            ),
                          ),
                          Text(
                            "₹ ${totalAmount.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: ColorManager.blackColor,
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final order = CartModel(
                            amount: totalAmount,
                            userId: UserPreferences.uid,
                            productList: productDetails,
                            quantity: productDetails.length,
                          );

                          await dio.Dio()
                              .post(
                            "${APIConstants.baseUrl}cart/placedToOrder",
                            data: order.toJson(),
                          )
                              .then((value) {
                            final bar = WarningBar();
                            final orderPlaced = bar.snack("Order Placed Successfully", ColorManager.greenColor);
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(orderPlaced);
                            ref.watch(cartList.notifier).clearCartList();

                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(350.w, 50.h),
                          backgroundColor: ColorManager.blackColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Processed to checkout",
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorManager.whiteColor,
                              ),
                            ),
                            Image.asset(
                              IconAssets.rightIcon,
                              height: 30,
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

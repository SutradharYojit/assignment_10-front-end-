import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/resources.dart';
import 'cart_list_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CartScreen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final cartItem = ref.read(cartList);
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
                            "₹ ${totalAmount}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: ColorManager.blackColor,
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // context.push(RoutesName.cartDeliveryScreen);
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

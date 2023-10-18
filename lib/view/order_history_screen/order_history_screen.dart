import 'dart:developer';
import 'package:assignement_10/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'order_history_provider.dart';

class WishListScreen extends ConsumerStatefulWidget {
  const WishListScreen({super.key});

  @override
  ConsumerState<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends ConsumerState<WishListScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(orderHistory.notifier).userOrderHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final data = ref.watch(orderHistory);
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(15.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order Status: Placed",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
                                ),
                                Text(
                                  "Quantity: ${data[index].quantity}",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
                                ),
                                Text(
                                  "Total Amount: ${data[index].amount?.toStringAsFixed(2)}",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 75.h,
                                  child: ListView.builder(
                                    itemCount: data[index].productList!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.push(RoutesName.productDetailsScreen,
                                                extra: data[index].productList![index]);
                                          },
                                          child: Container(
                                            width: 75,
                                            decoration: BoxDecoration(
                                              color: Colors.purple,
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  data[index].productList![index].imageUrl!,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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

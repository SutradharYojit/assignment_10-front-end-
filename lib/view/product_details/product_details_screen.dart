
import 'dart:developer';

import 'package:assignement_10/view/cart/cart_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/product_model.dart';
import '../../resources/resources.dart';
import '../../widget/widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productDetails}) : super(key: key);

  final ProductList productDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0.w),
              child: Hero(
                tag: "image",
                child: Image.network(
                  productDetails.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productDetails.title!,
                            style: TextStyle(fontSize: 15.sp, color: ColorManager.blackColor),
                          ),
                          Text(
                            productDetails.brand!,
                            style: TextStyle(fontSize: 12.sp, color: ColorManager.greyColor),
                          ),
                          Text(
                            "₹ ${productDetails.price!}",
                            style: TextStyle(fontSize: 15.sp, color: ColorManager.blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.r, bottom: 10.r),
                    child: Text(
                      "Description",
                      style: TextStyle(fontSize: 17.sp, color: ColorManager.blackColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    productDetails.description!,
                    style: TextStyle(fontSize: 15, color: ColorManager.darkGreyColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer(
          builder: (context, ref, child) {
            return PrimaryButton(
              onTap: () {
                ref.watch(cartList.notifier).addToCartList(productDetails);
                Navigator.pop(context);
              },
              title: "Add To Cart",
              color: ColorManager.blackColor,
            );
          },
        ),
      ),
    );
  }
}

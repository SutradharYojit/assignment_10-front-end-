import 'package:assignement_10/routes/routes_name.dart';
import 'package:assignement_10/view/home/components/product_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../resources/resources.dart';

// we are showing the data of the product in the grid view
class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(productList);
        return GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(RoutesName.productDetailsScreen, extra: data[index]);
                  },
                  child: Container(
                    height: 160.h,
                    margin: const EdgeInsets.only(bottom: 10).r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        // image: NetworkImage(value.productData[index].thumbnail.toString()),
                        image: NetworkImage(data[index].imageUrl!),
                        fit: BoxFit.cover,
                      ),
                      color: ColorManager.greyOpacityColor,
                      borderRadius: BorderRadius.circular(20).w,
                    ),
                  ),
                ),
                Text(
                  data[index].title!,
                  softWrap: true,
                  maxLines: 2,
                  style: const TextStyle(fontFamily: "Varela", fontWeight: FontWeight.w600),
                ),
                Text(
                  data[index].brand!,
                ),
                Text(
            "₹ ${data[index].price!.toString()}",
                ),
              ],
            );
          },
        );
      },
    );
  }
}

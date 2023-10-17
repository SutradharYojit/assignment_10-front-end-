import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/resources.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.textCtrl,
    this.onFieldSubmitted,
    required this.child,
    required this.onPressed,
  });

  final TextEditingController? textCtrl;
  final Widget child;
  final VoidCallback onPressed;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: ColorManager.rgbWhiteColor,
                borderRadius: BorderRadius.circular(20.w),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onPressed,
                    icon: SizedBox(
                      height: 21.h,
                      child: Image.asset(
                        IconAssets.searchIcon,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textCtrl,
                      onFieldSubmitted: onFieldSubmitted,
                      cursorHeight: 24,
                      cursorRadius: const Radius.circular(10).w,
                      cursorColor: ColorManager.blackColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(left: 11).r,
                        hintText: "Search",
                        // border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
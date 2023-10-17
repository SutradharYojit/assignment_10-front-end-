import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/resources.dart';

class TextRich extends StatelessWidget {
  const TextRich({
    super.key,
    required this.firstText,
    required this.secText,
  });

  final String firstText;
  final String secText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style:   TextStyle(color: ColorManager.gradientNeonColor, fontSize: 14.sp),
        children: <TextSpan>[
          TextSpan(
            text: '\t $secText',
            style:   TextStyle(
              color: ColorManager.blackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}


class RichTxt extends StatelessWidget {
  const RichTxt({
    super.key,
    required this.text_1,
    required this.text_2,
    required this.textSize_1,
    required this.textSize_2,
  });

  final String text_1;
  final String text_2;
  final double textSize_1;
  final double textSize_2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text_1,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize_1.sp,
            color: ColorManager.blackColor
        ),
        children: <TextSpan>[
          TextSpan(
            text: text_2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: textSize_2.sp,
              color: ColorManager.greyOpacityColor
            ),

          )
        ],
      ),
    );
  }
}
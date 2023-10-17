import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrcleAvatar extends StatelessWidget {
  const CrcleAvatar({
    super.key,
    required this.radius,
    required this.color,
    required this.child,
  });

  final double radius;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Container(
        padding: const EdgeInsets.all(7).w,
        child: child,
      ),
    );
  }
}
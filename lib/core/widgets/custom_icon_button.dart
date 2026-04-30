import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.height = 32,
    required this.backGroundColor,
    required this.onPressed,
    required this.icon,
  });

  final double height;
  final Color backGroundColor;
  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      decoration: BoxDecoration(shape: .circle, color: backGroundColor),
      child: IconButton(onPressed: onPressed, icon: Icon(icon)),
    );
  }
}

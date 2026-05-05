import 'package:e_wallet/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsButton extends StatelessWidget {
  const TransactionsButton({
    super.key,
    required this.onTap,
    this.containerHeight = 100,
    this.containerWidth = 100,
    required this.containerColor,
    this.iconBackgroundHeight = 40,
    this.iconBackgroundWidth = 40,
    required this.iconBackgroundColor,
    required this.icon,
    required this.text,
    required this.shadowColor,
    required this.textColor,
  });
  final Function() onTap;
  final double containerHeight;
  final double containerWidth;
  final Color containerColor;
  final Color shadowColor;
  final Color textColor;
  final double iconBackgroundHeight;
  final double iconBackgroundWidth;
  final Color iconBackgroundColor;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: containerWidth.w,
        height: containerHeight.h,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: containerColor.withValues(alpha: 0.25),
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 14,
          children: [
            Container(
              width: iconBackgroundWidth.w,
              height: iconBackgroundHeight.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: iconBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),

              child: Icon(icon, color: AppColors.grey100),
            ),
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

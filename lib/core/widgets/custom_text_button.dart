import 'package:e_wallet/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });

  final String title;
  final Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.all(Radius.circular(63)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: Colors.white),
              ),
      ),
    );
  }
}

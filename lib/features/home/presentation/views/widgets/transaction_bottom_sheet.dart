import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class TransactionBottomSheet extends StatelessWidget {
  const TransactionBottomSheet({
    super.key,
    required this.primaryField,
    this.secondaryField,
    required this.buttonText,
    required this.onTap,
    this.isLoading,
  });

  final Widget primaryField;
  final Widget? secondaryField;
  final String buttonText;
  final Function() onTap;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.grey100,
            borderRadius: .only(
              topLeft: .circular(10),
              topRight: .circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              spacing: 12,
              children: [
                primaryField,
                if (secondaryField != null) ...[secondaryField!],

                CustomTextButton(
                  isLoading: isLoading!,
                  title: buttonText,
                  onPressed: onTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

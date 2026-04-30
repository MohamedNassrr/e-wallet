import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/core/widgets/custom_text_icon_button.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_state.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpRowIcons extends StatelessWidget {
  const OtpRowIcons({
    super.key,
    required this.otpController,
    required this.cubit,
    required this.authStates,
  });

  final PinInputController otpController;
  final AuthCubit cubit;
  final AuthStates authStates;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.black,
          ),
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
        CustomTextIconButton(
          text: l10n.nextButton,
          icon: Icons.arrow_forward_outlined,
          textColor: Colors.white,
          onPressed: () {
            cubit.submitOtp(otpController.text);
          },
          boarderRadius: 30,
          width: 100,
          height: 45,
          iconColor: Colors.white,
          isIconFirst: false,
          isLoading: authStates is AuthLoadingStates ? true : false,
        ),
      ],
    );
  }
}

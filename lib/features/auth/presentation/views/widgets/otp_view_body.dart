import 'package:e_wallet/core/utils/app_routing.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_state.dart';
import 'package:e_wallet/features/auth/presentation/views/widgets/otp_row_icons.dart';
import 'package:e_wallet/features/home/presentation/controller/wallet_cubit/wallet_cubit.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpViewBody extends StatelessWidget {
  OtpViewBody({super.key});

  final PinInputController otpController = PinInputController();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) async {
        if (state is AuthSuccessStates) {
          await context.read<WalletCubit>().createWallet();
          if (context.mounted) GoRouter.of(context).go(AppRouting.rHomeView);
        }
      },
      builder: (context, state) {
        var authCubit = context.read<AuthCubit>();
        return Padding(
          padding: const EdgeInsets.all(31),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 10,
            children: [
              Text(
                l10n.enterOtp,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              MaterialPinField(
                pinController: otpController,
                length: 6,
                autoFocus: true,
                theme: MaterialPinTheme(
                  borderRadius: BorderRadius.circular(12),
                  borderWidth: 0,
                  fillColor: Colors.grey[200],
                  focusedFillColor: Colors.grey[200],
                  disabledFillColor: Colors.grey[200],
                  borderColor: Colors.transparent,
                  focusedBorderColor: Colors.transparent,
                  disabledBorderColor: Colors.transparent,
                  errorBorderColor: Colors.red,
                  errorFillColor: Colors.grey[200],
                ),
                onCompleted: (code) {
                  otpController.text = code;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              OtpRowIcons(
                otpController: otpController,
                cubit: authCubit,
                authStates: state,
              ),
            ],
          ),
        );
      },
    );
  }
}

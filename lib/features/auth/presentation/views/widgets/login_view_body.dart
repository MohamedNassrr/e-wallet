import 'package:e_wallet/core/utils/app_routing.dart';
import 'package:e_wallet/core/widgets/custom_form_field.dart';
import 'package:e_wallet/core/widgets/custom_text_button.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_state.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthCodeSubmittedStates) {
          GoRouter.of(
            context,
          ).push(AppRouting.rOtpView, extra: context.read<AuthCubit>());
        }
      },
      builder: (context, state) {
        var authCubit = context.read<AuthCubit>();
        return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: .end,
            children: [
              Expanded(child: Container(color: Colors.white)),
              Container(
                height: 250.h,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(31),
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    spacing: 12,
                    children: [
                      Text(
                        l10n.enterPhoneNumber,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomFormField(
                        controller: phoneController,
                        inputType: TextInputType.phone,
                        onSubmit: (_) {
                          if (formKey.currentState!.validate()) {
                            authCubit.phoneAuth(
                              phoneNumber: phoneController.text,
                            );
                          }
                        },
                        hintText: '01XX XXX XXXX',
                      ),
                      CustomTextButton(
                        title: l10n.continueButton,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            authCubit.phoneAuth(
                              phoneNumber: phoneController.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

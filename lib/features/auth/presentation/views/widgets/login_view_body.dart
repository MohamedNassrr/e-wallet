import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/core/utils/app_routing.dart';
import 'package:e_wallet/core/utils/assets_data.dart';
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Image.asset(
                        AssetsData.loginCard,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Text(
                        l10n.featureForward,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.grey300,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
              Container(
                height: 250.h,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
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
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.grey400,
                        ),
                      ),
                      CustomFormField(
                        prefixIcon: Icons.phone_outlined,
                        controller: phoneController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return l10n.phoneValidation;
                          }
                          if (value.length != 11) {
                            return l10n.phoneLengthValidation;
                          }
                          return null;
                        },
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
                        isLoading: State is AuthLoadingStates ? true : false,
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

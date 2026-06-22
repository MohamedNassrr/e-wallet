import 'package:e_wallet/core/services/biometric_service.dart';
import 'package:e_wallet/core/services/service_locator.dart';
import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthCubit(getIt.get<BiometricService>()),
          child: const LoginViewBody(),
        ),
      ),
    );
  }
}

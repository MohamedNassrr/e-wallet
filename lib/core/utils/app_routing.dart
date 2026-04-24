import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/views/login_view.dart';
import 'package:e_wallet/features/auth/presentation/views/otp_view.dart';
import 'package:e_wallet/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouting {
  static const rLoginView = '/';
  static const rOtpView = '/OtpView';
  static const rHomeView = '/HomeView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: rLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: rOtpView,
        builder: (context, state) => BlocProvider.value(
          value:  state.extra as AuthCubit,
          child: const OtpView(),
        ),
      ),
      GoRoute(path: rHomeView, builder: (context, state) => const HomeView()),
    ],
  );
}

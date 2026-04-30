import 'package:e_wallet/core/services/service_locator.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/views/login_view.dart';
import 'package:e_wallet/features/auth/presentation/views/otp_view.dart';
import 'package:e_wallet/features/home/data/repos/wallet_repo.dart';
import 'package:e_wallet/features/home/presentation/controller/wallet_cubit/wallet_cubit.dart';
import 'package:e_wallet/features/home/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouting {
  static const rLoginView = '/';
  static const rOtpView = '/OtpView';
  static const rHomeView = '/HomeView';

  static final router = GoRouter(
    initialLocation: initialLocation(),
    routes: [
      GoRoute(path: rLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: rOtpView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: state.extra as AuthCubit),
            BlocProvider(
              create: (context) => WalletCubit(getIt.get<WalletRepo>()),
            ),
          ],
          child: const OtpView(),
        ),
      ),
      GoRoute(
        path: rHomeView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
           
            BlocProvider(
              create: (context) => WalletCubit(getIt.get<WalletRepo>())..fetchWallet(),
            ),
          ],
          child: const HomeView(),
        ),
      ),
    ],
  );
  static String initialLocation() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null ? rHomeView : rLoginView;
  }
}

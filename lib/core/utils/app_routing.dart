import 'package:e_wallet/features/auth/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouting {
  static const rLoginView = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(path: rLoginView, builder: (context, state) => const LoginView()),
    ],
  );
}

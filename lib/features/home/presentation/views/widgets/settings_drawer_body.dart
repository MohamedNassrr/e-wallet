import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/core/utils/app_routing.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/controller/auth_cubit/auth_state.dart';
import 'package:e_wallet/features/home/presentation/controller/settings_cubit/settings_cubit.dart';
import 'package:e_wallet/features/home/presentation/views/widgets/settings_tile.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingsDrawerBody extends StatelessWidget {
  const SettingsDrawerBody({super.key});

  @override
  Widget build(BuildContext context) {

    final settingsCubit = context.read<SettingsCubit>();
    final settingsState = context.watch<SettingsCubit>().state;
    final l10n = S.of(context);
    
    return Drawer(
      width: 270.w,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 55, 8, 20),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            Text(
              l10n.accountAndPreferences,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20.h),
            SettingsTile(
              onTap: () {
                settingsCubit.toggleTheme();
              },
              icon: Icons.dark_mode_outlined,
              title: l10n.darkMode,
              trailing: Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: settingsState.themeMode == ThemeMode.dark,
                  onChanged: (_) {},
                  activeThumbColor: AppColors.teal,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SettingsTile(
              icon: Icons.language_outlined,
              title: l10n.language,
              trailing: Transform.scale(
                scale: 0.8,
                child: DropdownButton(
                  value: settingsState.locale.languageCode,
                  style: Theme.of(context).textTheme.bodyMedium,
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('English')),
                    DropdownMenuItem(value: 'ar', child: Text('العربية')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      settingsCubit.changeLanguage(Locale(value));
                    }
                  },
                ),
              ),
            ),
            const Spacer(),
            BlocListener<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is SignOutSuccessStates) {
                  GoRouter.of(context).go(AppRouting.rLoginView);
                }
              },
              child: SettingsTile(
                onTap: () {
                  context.read<AuthCubit>().signOut();
                },
                icon: Icons.logout_outlined,
                title: l10n.logOut,
                subTitle: Text(
                  l10n.signOutFromYourAccount,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
                ),
                trailing: Transform.scale(
                  scale: 0.8,
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

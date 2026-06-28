import 'package:e_wallet/bloc_obsever.dart';
import 'package:e_wallet/core/services/service_locator.dart';
import 'package:e_wallet/core/themes/app_theme.dart';
import 'package:e_wallet/core/utils/app_routing.dart';
import 'package:e_wallet/features/home/presentation/controller/settings_cubit/settings_cubit.dart';
import 'package:e_wallet/features/home/presentation/controller/settings_cubit/settings_state.dart';
import 'package:e_wallet/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  serviceLocator();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      ensureScreenSize: true,
      splitScreenMode: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: BlocProvider(
          create: (context) => SettingsCubit(),
          child: BlocBuilder<SettingsCubit,SettingsState>(
            builder: (context, state) {
              return MaterialApp.router(
                routerConfig: AppRouting.router,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                locale: state.locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                themeMode: state.themeMode,
                debugShowCheckedModeBanner: false,
              );
            },
          ),
        ),
      ),
    );
  }
}

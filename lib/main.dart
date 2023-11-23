import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/style.dart';
import 'package:food_hub/controller/language_controller.dart';
import 'package:food_hub/firebase_options.dart';
import 'package:food_hub/router/app_router.dart';
import 'package:food_hub/services/firebase_message.dart';
import 'configs/basic_config.dart';
import 'configs/constant_varible.dart';
import 'generated/l10n.dart';

FutureOr<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseMessService().initNotification();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent));
  await setupHive();
  getIt.registerSingleton<AppRouter>(AppRouter());
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
  FlutterNativeSplash.remove();
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..backgroundColor = Colors.transparent
    ..indicatorColor = kPrimaryColor
    ..textColor = Colors.transparent
    ..boxShadow = <BoxShadow>[]
    ..maskColor = Colors.transparent
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.custom
    ..dismissOnTap = false;
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.focusedChild?.unfocus();
            }
          },
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(ref.watch(getLanguageProvider)),
            builder: EasyLoading.init(),
            routerConfig: appRouter.config(),
          ),
        );
      },
    );
  }
}

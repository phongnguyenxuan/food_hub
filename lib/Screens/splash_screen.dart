import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/configs/style.dart';
import 'package:food_hub/router/app_router.gr.dart';

import '../controller/api_controller.dart';
import '../controller/login_controller.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  static const String id = "Splash screen";

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _showAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _showAnimation = true;
      });
      if (ref.watch(isLoginProvider)) {
        Future.wait([
          ref.read(apiControlProvider.notifier).getProfile(),
          ref.read(cateControlProvider.notifier).getCategories(),
          ref.read(restaurantsControlProvider.notifier).getRestaurants(),
        ]).then((value) {
          router.replace(const SwitchSiginRoute());
        });
      } else {
        Future.delayed(const Duration(milliseconds: 2500)).then((value) {
          FirebaseMessaging.instance.getInitialMessage().then((value) {
            if (value != null) {
             router.replace(const NotificationRoute());
            } else {
              router.replace(const SwitchSiginRoute());
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: kPrimaryColor),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: AnimatedOpacity(
            opacity: _showAnimation ? 1 : 0,
            duration: const Duration(milliseconds: 1500),
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 96.w),
              child: Image.asset(
                splashImgePath,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

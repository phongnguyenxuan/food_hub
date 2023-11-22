import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/Screens/verify_screen.dart';
import 'package:food_hub/Screens/welcome_screen.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/configs/style.dart';
import 'package:food_hub/controller/api_controller.dart';
import 'package:food_hub/controller/switch_method_controller.dart';
import 'package:food_hub/models/user/user_model.dart';
import 'package:food_hub/router/app_router.gr.dart';
import 'package:food_hub/widgets/custom_button.dart';

import '../controller/login_controller.dart';

@RoutePage()
class SwitchSiginScreen extends ConsumerStatefulWidget {
  const SwitchSiginScreen({super.key});
  static const String id = "Switch method screen";

  @override
  ConsumerState<SwitchSiginScreen> createState() => _SwitchSiginMethodState();
}

class _SwitchSiginMethodState extends ConsumerState<SwitchSiginScreen> {
  @override
  Widget build(BuildContext context) {
    bool isActive = ref.watch(getswitchProvider);
    UserModel? userModel = ref.watch(userController);
    bool isLogin = ref.watch(isLoginProvider);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Switch sign in method\n(API)",
                textAlign: TextAlign.center,
                style: titleHomeStyle,
              ),
            ),
            Switch(
              // This bool value toggles the switch.
              value: isActive,
              activeColor: kPrimaryColor,
              onChanged: (bool value) {
                ref.read(switchProvider.notifier).updateSwitch(value);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onTap: () {
                if (isLogin &&
                    isActive &&
                    userModel != null &&
                    !userModel.isVerifiedEmail) {
                      router.replace(const VerifyRoute());
                } else {
                  router.pushAndPopUntil(const WelcomeRoute(), predicate: (route) => false,);
                }
              },
              color: kPrimaryColor,
              radius: 15,
              padding: const EdgeInsets.all(10),
              child: Text(
                "Go to main app",
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 16.sp,
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

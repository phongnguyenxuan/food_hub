import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/configs/style.dart';
import 'package:food_hub/controller/api_controller.dart';
import 'package:food_hub/controller/auth_controller.dart';
import 'package:food_hub/controller/switch_method_controller.dart';
import 'package:food_hub/models/user/user_model.dart';
import 'package:food_hub/router/app_router.gr.dart';
import 'package:food_hub/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

import '../controller/login_controller.dart';

@RoutePage()
class VerifyScreen extends ConsumerStatefulWidget {
  const VerifyScreen({super.key});
  static const String id = "Verify screen";
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends ConsumerState<VerifyScreen> {
  bool _isVerify = false;
  bool _isVisib = true;
  Timer? timer;
  int count = 60;
  TextEditingController pinController = TextEditingController();
  void checkVerify() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await ref.read(authControllerProvider.notifier).user!.reload();
      setState(() {
        _isVerify =
            ref.read(authControllerProvider.notifier).user!.emailVerified;
      });
      debugPrint("verify: $_isVerify");
      if (_isVerify) {
        timer.cancel();
        if (mounted) router.replace(const HomeRoute());
      }
    });
  }

  @override
  void initState() {
    // _isVerify = ref.read(authControllerProvider.notifier).user!.emailVerified;
    // if (!_isVerify) {
    //   checkVerify();
    // }

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isActive = ref.watch(getswitchProvider);
    bool isLogin = ref.watch(isLoginProvider);
    return Builder(
      builder: (context) {
        if (isActive && isLogin) {
          return apiVerifi(context);
        }
        return firebaseVerifi(context);
      },
    );
  }

  Scaffold apiVerifi(BuildContext context) {
    UserModel? userModel = ref.watch(userController);
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        elevation: 0,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/ellipse_bg.png",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: RichText(
              text: TextSpan(
                text: "Verification Code",
                style: titleTextStyle,
                children: [
                  TextSpan(
                      text:
                          "\nPlease type the verification code sent to\n${userModel?.email}",
                      style: k14fontsizeW400grey),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Pinput(
                length: 6,
                animationDuration: const Duration(milliseconds: 100),
                controller: pinController,
                pinAnimationType: PinAnimationType.slide,
                onCompleted: (value) {
                  ref.read(apiControlProvider.notifier).verification(code: value, context: context);
                },
                cursor: Container(
                  width: 1.5,
                  height: 22,
                  color: kYellowColor,
                ),
                focusedPinTheme: PinTheme(
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(width: 1, color: kPrimaryColor))),
                defaultPinTheme: PinTheme(
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            width: 1, color: kBoderTextFieldDefault))),
              ),
            ),
          ),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
                text: TextSpan(
                    text: "I don’t recevie a code! ",
                    style: k16W500ColorFF5B5B5EStyle,
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = _isVisib
                            ? () async {
                                await ref
                                    .read(apiControlProvider.notifier)
                                    .sendVerification(email: userModel!.email)
                                    .then((value) {
                                  timer = Timer.periodic(
                                      const Duration(seconds: 1), (timer) {
                                    setState(() {
                                      count--;
                                      _isVisib = false;
                                      if(count == 0) {
                                        timer.cancel();
                                        count = 60;
                                        _isVisib = true;
                                      }
                                    });
                                  });
                                });
                              }
                            : null,
                      text: _isVisib ? "Please resend" : "Retry in $count",
                      style: k16W500PrimaryColorStyle)
                ])),
          )
        ],
      ),
    );
  }

  Scaffold firebaseVerifi(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        elevation: 0,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/ellipse_bg.png",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mark_email_unread_rounded,
              size: 100.sp,
              color: kPrimaryColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Verify your email",
              style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 25.sp,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Please click on the link ',
                style: TextStyle(
                    fontSize: 15.sp,
                    color: kBlackColor,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          'in the email we just sent you to confirm your email.',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: kBlackColor,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I didn't receive a link! ",
                  style: TextStyle(fontFamily: fontFamily, fontSize: 14.sp),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              onTap: () {
                Future.delayed(Duration.zero, () {
                  ref.read(authControllerProvider.notifier).signOut(context);
                });
              },
              padding: EdgeInsets.symmetric(vertical: 20.h),
              // margin: EdgeInsets.symmetric(vertical: 50.h, horizontal: 15.w),
              radius: 30,
              color: kWhiteColor,
              borderColor: kPrimaryColor,
              child: Center(
                child: Text(
                  "Back to login",
                  style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 15.sp,
                      letterSpacing: 1.2.sp,
                      color: kPrimaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

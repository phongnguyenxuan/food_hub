import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/Screens/main_screen.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/controller/language_controller.dart';
import 'package:food_hub/router/app_router.gr.dart';
import 'package:food_hub/widgets/custom_button.dart';
import 'package:food_hub/widgets/facebook_button.dart';
import 'package:food_hub/widgets/google_button.dart';
import 'package:style/default_color.dart';

import '../controller/login_controller.dart';
import '../controller/switch_method_controller.dart';

@RoutePage()
class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});
  static const String id = "welcome screen";

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  String dropdownValue = listLanguages.first;

  @override
  Widget build(BuildContext context) {
    bool isActive = ref.watch(getswitchProvider);
    bool isLogin = ref.watch(isLoginProvider);
    return Builder(
      builder: (context) {
        if (isActive) {
          if (isLogin) {   
            return const AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    systemNavigationBarColor: Colors.transparent),
                child: MainScreen());
          } else {
            return welcome(context);
          }
        } else {
          if (FirebaseAuth.instance.currentUser != null) {
            return const AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    systemNavigationBarColor: Colors.transparent),
                child: MainScreen());
          } else {
            return welcome(context);
          }
        }
      },
    );
  }

  AnnotatedRegion<SystemUiOverlayStyle> welcome(BuildContext context) {
    var currentLocale = ref.watch(getLanguageProvider);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                welcomeBGPath,
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp,
                colors: [
                  DefaultColors.startLinearColor,
                  DefaultColors.endLinearColor,
                ]),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SafeArea(
              bottom: false,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //header
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 26.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton<String>(
                                value: (!listLanguages.contains(currentLocale))
                                    ? null
                                    : currentLocale,
                                underline: Container(),
                                borderRadius: BorderRadius.circular(15),
                                elevation: 2,
                                items: listLanguages
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 7),
                                          child: Text(value.toUpperCase()),
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "$assetsImagesPath$value.png"))),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  ref
                                      .read(languageProvider.notifier)
                                      .updateLanguage(value!);
                                },
                              ),
                              CustomButton(
                                onTap: () {},
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 10.h),
                                boxShadow: const [
                                  BoxShadow(
                                      color: DefaultColors.whiteShadowColor, blurRadius: 3.5)
                                ],
                                color: DefaultColors.whiteColor,
                                radius: 27,
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: DefaultColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 102.h,
                          ),
                          //Text
                          RichText(
                            text: TextSpan(
                              text: trans.welcome,
                              style: const TextStyle(
                                  fontFamily: fontFamily,
                                  height: 1.28,
                                  color: DefaultColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 53),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\nFoodHub',
                                  style: TextStyle(
                                    fontFamily: fontFamily,
                                    color: DefaultColors.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 45.sp,
                                    height: 1.28,
                                  ),
                                ),
                                // TextSpan(text: ' world!'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 19.h,
                          ),
                          //Text
                          Text(
                            trans.yourFavourite,
                            style: TextStyle(
                              fontFamily: fontFamily,
                              color: DefaultColors.blackColor,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              //sigin with
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 84.w,
                                    height: 1,
                                    color: DefaultColors.white50Color,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 17.w),
                                    child: Text(
                                      trans.signinWith,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: fontFamily,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                  Container(
                                    width: 84.w,
                                    height: 1,
                                    color: DefaultColors.white50Color,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              //Login with google or facebook
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: FacebookButton(
                                      ref: ref,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35.w,
                                  ),
                                  Expanded(
                                    child: GoogleButton(
                                      ref: ref,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 23.h,
                              ),
                              //start with email or phone
                              Center(
                                child: CustomButton(
                                  onTap: () => router.push(const SignUpRoute()),
                                  color: DefaultColors.transparentWhieColor,
                                  buttonKey: GlobalKey(),
                                  radius: 30,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 19, horizontal: 59),
                                  borderColor: DefaultColors.whiteColor,
                                  child: Text(
                                    trans.startWith,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        color: DefaultColors.whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.sp),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 25.h), //  Already have an account?
                              RichText(
                                text: TextSpan(
                                    text: trans.alreadyHave,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: fontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: DefaultColors.whiteColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: trans.signIn,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            router.push(const LoginRoute());
                                          },
                                        style: TextStyle(
                                            fontFamily: fontFamily,
                                            color: DefaultColors.whiteColor,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

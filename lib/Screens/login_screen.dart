import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/Screens/forgot_password.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/controller/api_controller.dart';
import 'package:food_hub/provider/firebae_provider.dart';
import 'package:food_hub/router/app_router.gr.dart';
import 'package:food_hub/widgets/custom_button.dart';
import 'package:food_hub/widgets/custom_textfield.dart';
import 'package:food_hub/widgets/facebook_button.dart';
import 'package:food_hub/widgets/google_button.dart';
import 'package:style/default_color.dart';
import 'package:style/default_text_style.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  static const String id = "Login screen";

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> mailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passKey = GlobalKey<FormState>();

  Future<void> loginWithEmail(String email, String password) async {
    // await ref.read(authControllerProvider.notifier).loginWithEmail(email, password, context);
    // if (mounted) authStateChange(context);
    await ref
        .read(apiControlProvider.notifier)
        .signIn(email: email, password: password, context: context);
    if (mounted) stateChange(ref, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: DefaultColors.whiteColor,
        elevation: 0,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      appbarImagePath,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            //back button
            Container(
              margin: EdgeInsets.only(left: 25.w, top: 37.h),
              child: CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                color: DefaultColors.whiteColor,
                padding: const EdgeInsets.all(10),
                radius: 15,
                boxShadow: const [
                  BoxShadow(
                    color: DefaultColors.whiteShadowColor,
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ],
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: DefaultColors.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height > 800 ? 50.h : 20.h,
                  ),
                  Text(
                    trans.signIn,
                    style: DefaultTextStyles.titleTextStyle,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextField(
                    formKey: mailKey,
                    controller: mailController,
                    title: trans.email,
                    hintText: trans.mailMessage,
                    haveSurffixIcon: false,
                    textInputType: TextInputType.emailAddress,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextField(
                    formKey: passKey,
                    controller: passwordController,
                    title: trans.pass,
                    hintText: trans.pass,
                    haveSurffixIcon: true,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  ),
                ],
              ),
            ),
            //forgot pass
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32.h),
                    child: Center(
                      child: TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed(ForgotPassScreen.id),
                        child: Text(
                          trans.forgot,
                          style: TextStyle(
                              fontFamily: fontFamily,
                              color: DefaultColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h),
                    child: CustomButton(
                      onTap: () {
                        if (mailKey.currentState!.validate() &&
                            passKey.currentState!.validate()) {
                          loginWithEmail(
                              mailController.text, passwordController.text);
                        }
                      },
                      color: DefaultColors.primaryColor,
                      radius: 30,
                      padding: EdgeInsets.symmetric(vertical: 25.h),
                      boxShadow: const [
                        BoxShadow(
                            color: DefaultColors.greyShadowColor,
                            blurRadius: 20,
                            offset: Offset(0, 10))
                      ],
                      child: Center(
                        child: Text(
                          trans.signIn.toUpperCase(),
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: fontFamily,
                              letterSpacing: 1.2.sp,
                              color: DefaultColors.whiteColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "${trans.dontHave} ",
                        style: DefaultTextStyles.haveAccTextStyle,
                        children: [
                          TextSpan(
                            text: trans.signUp,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                router.replace(const SignUpRoute());
                              },
                            style: TextStyle(
                                fontFamily: fontFamily,
                                color: DefaultColors.primaryColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 54.h,
                  ),
                  //sigin with
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 84.w,
                        height: 1,
                        color: DefaultColors.dividerBlackColor,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.w),
                        child: Text(
                          trans.signinWith,
                          style: TextStyle(
                              color: DefaultColors.textBlack50Color,
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                      ),
                      Container(
                        width: 84.w,
                        height: 1,
                        color: DefaultColors.dividerBlackColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
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
                    height: 28.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

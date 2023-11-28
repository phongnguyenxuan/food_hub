import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/widgets/facebook_button.dart';
import 'package:food_hub/widgets/google_button.dart';
import 'package:style/default_color.dart';
import 'package:style/default_text_style.dart';

import '../configs/constant_varible.dart';
import '../controller/api_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'login_screen.dart';

@RoutePage()
class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  static const String id = "SignUp screen";

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> mailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passKey = GlobalKey<FormState>();

  //signUp with email
  Future<void> signUpWithEmail(
      String email, String password, String userName) async {
    // await ref
    //     .read(authControllerProvider.notifier)
    //     .signUpWithEmail(userName, email, password, context);
    // setState(() {});
    await ref.read(apiControlProvider.notifier).signUp(
        userName: userName, email: email, password: password, context: context);
    // if (mounted) stateChange(ref, context);
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
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
            Padding(
              padding: EdgeInsets.only(left: 27.w, top: 37.h),
              child: CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                color: DefaultColors.whiteColor,
                padding: const EdgeInsets.all(10),
                radius: 15,
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
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(trans.signUp, style: DefaultTextStyles.titleTextStyle),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextField(
                    formKey: nameKey,
                    controller: nameController,
                    title: trans.fullName,
                    hintText: trans.nameMessage,
                    haveSurffixIcon: false,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextField(
                    formKey: mailKey,
                    controller: mailController,
                    title: trans.email,
                    hintText: trans.mailMessage,
                    textInputType: TextInputType.emailAddress,
                    haveSurffixIcon: false,
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
                  //sign up button
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h),
                    child: CustomButton(
                      onTap: () {
                        if (nameKey.currentState!.validate() &&
                            mailKey.currentState!.validate() &&
                            passKey.currentState!.validate()) {
                          signUpWithEmail(mailController.text,
                              passwordController.text, nameController.text);
                        }
                      },
                      color: DefaultColors.primaryColor,
                      radius: 30,
                      boxShadow: const [
                        BoxShadow(
                            color: DefaultColors.greyShadowColor,
                            blurRadius: 20,
                            offset: Offset(0, 10))
                      ],
                      padding: EdgeInsets.symmetric(vertical: 25.h),
                      child: Center(
                        child: Text(
                          trans.signUp.toUpperCase(),
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
                        text: trans.alreadyHave,
                        style: DefaultTextStyles.haveAccTextStyle,
                        children: [
                          TextSpan(
                            text: trans.signIn,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.id);
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
                  SizedBox(height: 23.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

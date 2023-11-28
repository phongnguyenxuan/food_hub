import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/controller/auth_controller.dart';
import 'package:food_hub/widgets/custom_textfield.dart';
import 'package:style/default_color.dart';
import 'package:style/default_text_style.dart';

import '../configs/constant_varible.dart';
import '../widgets/custom_button.dart';

@RoutePage()
class ForgotPassScreen extends ConsumerStatefulWidget {
  const ForgotPassScreen({super.key});
  static const String id = "forgot pass";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPassScreenState();
}

class _ForgotPassScreenState extends ConsumerState<ForgotPassScreen> {
  TextEditingController mailController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 26, bottom: 12),
              child: Text(
                "Resset Password",
                style: DefaultTextStyles.titleTextStyle,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 26, bottom: 38),
              child: Text(
                "Please enter your email address to\nrequest a password reset",
                style: DefaultTextStyles.k14fontsizeW400grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: CustomTextField(controller: mailController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: CustomButton(
                  onTap: () async {
                    await ref
                        .read(authControllerProvider.notifier)
                        .forgotPassword(context, mailController.text);
                  },
                  color: DefaultColors.primaryColor,
                  radius: 28.5,
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 45),
                  child: Text(
                    "Send new password".toUpperCase(),
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: fontFamily,
                        letterSpacing: 1.2.sp,
                        color: DefaultColors.whiteColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

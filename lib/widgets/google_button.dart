import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/default_color.dart';
import 'package:style/default_text_style.dart';
import '../controller/auth_controller.dart';
import '../provider/firebae_provider.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, required this.ref});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        ref.read(authControllerProvider.notifier).logInWithGoogle(context);
        authStateChange(context);
      },
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(DefaultColors.whiteColor),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(13)),
        shadowColor: const MaterialStatePropertyAll(DefaultColors.whiteShadowColor),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
      ),
      child: Row(
        children: [
          Container(
            width: 29.w,
            height: 29.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/google-icon.png"),
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          const Text(
            "GOOGLE",
            style: DefaultTextStyles.googleTextStyle,
          ),
        ],
      ),
    );
  }
}

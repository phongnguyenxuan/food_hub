import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/controller/api_controller.dart';
import 'package:food_hub/controller/switch_method_controller.dart';
import 'package:food_hub/models/user/user_model.dart';
import 'package:food_hub/router/app_router.gr.dart';
import 'package:food_hub/widgets/custom_button.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:style/default_color.dart';
import 'package:style/default_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/login_controller.dart';

@RoutePage()
class SwitchSiginScreen extends ConsumerStatefulWidget {
  const SwitchSiginScreen({super.key});
  static const String id = "Switch method screen";

  @override
  ConsumerState<SwitchSiginScreen> createState() => _SwitchSiginMethodState();
}

class _SwitchSiginMethodState extends ConsumerState<SwitchSiginScreen> {
  FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;

  Future<bool> checkFirebaseRemoteConfigForUpdateStatus() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    await firebaseRemoteConfig.fetchAndActivate();
    String value = firebaseRemoteConfig.getString('update_app');
    debugPrint("version : $value");
    bool isUpdate = version.contains(value);
    return isUpdate;
  }

  Future<void> checkForUpdate() async {
    await firebaseRemoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 60),
        minimumFetchInterval: const Duration(seconds: 0),
      ),
    );
    bool isUpdate = await checkFirebaseRemoteConfigForUpdateStatus();
    if (!isUpdate) {
      await Future.delayed(Duration.zero, () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              title: const Center(child: Text("App update")),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                        'A new version of Test APK is available,\ndo you want to upgrade?'),
                  ),
                ],
              ),
              actions: <Widget>[
                if (!isUpdate)
                  TextButton(
                      child: const Text("Later"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                TextButton(
                    child: const Text("Upgrade Now"),
                    onPressed: () async {
                      String url =
                          "https://www.youtube.com/watch?v=dQw4w9WgXcQ";
                      if (!await launchUrl(Uri.parse(url),
                              mode: LaunchMode.inAppWebView)
                          .then((value) {
                            Navigator.pop(context);
                            return value;
                          })) {
                        throw Exception('Could not launch $url');
                      }
                    }),
              ],
            );
          },
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkForUpdate();
  }

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
        backgroundColor: DefaultColors.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Switch sign in method\n(API)",
                textAlign: TextAlign.center,
                style: DefaultTextStyles.titleHomeStyle,
              ),
            ),
            Switch(
              // This bool value toggles the switch.
              value: isActive,
              activeColor: DefaultColors.primaryColor,
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
                  router.pushAndPopUntil(
                    const WelcomeRoute(),
                    predicate: (route) => false,
                  );
                }
              },
              color: DefaultColors.primaryColor,
              radius: 15,
              padding: const EdgeInsets.all(10),
              child: Text(
                "Go to main app",
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 16.sp,
                  color: DefaultColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

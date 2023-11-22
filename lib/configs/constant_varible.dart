import 'package:flutter/material.dart';
import 'package:food_hub/custom_icons_icons.dart';
import 'package:get_it/get_it.dart';

import '../generated/l10n.dart';
import '../router/app_router.dart';

final getIt = GetIt.instance;

final router = getIt<AppRouter>();

const String fontFamily = "SofiaPro";

const String appbarImagePath = "assets/images/ellipse_bg.png";

const String splashImgePath = "assets/images/splash.png";

const String welcomeBGPath = "assets/images/background.png";

const String welcome = "Welcome to";

const String welcomeMessage =
    "Your favourite foods delivered\nfast at your door.";

const String signInWith = "sign in with";

const String startWith = "Start with email or phone";

const String haveAccount = "Already have an account? ";

const String dontHaveAccount = "Don’t have an account?";

const String forgotPass = "Forgot password?";

const String signUp = "Sign up";

const String logIn = "Login";

const String whatWould = "What would you like\nto order";

const String avatarAssetsPath = "assets/images/avatar.png";

const String switchAssetsPath = "assets/images/switch.png";

const String assetsImagesPath = "assets/images/";

const List<String> supportedLanguage = ["vi", "en"];

const String boxAppSettingName = "boxAppSetting";

const String boxAPIName = "boxAPIName";

const String accessTokenDataName = "accessToken";

const String userIdName = "id";

const String refreshTokenDataName = "refreshToken";

const String defaultLanguage = 'en';

var trans = S.current;

String errorMessage(String code) {
  String res = "";
  switch (code) {
    case "invalid-email":
      res = trans.invalid;
      break;
    case "user-disabled":
      res = trans.userDisabled;
      break;
    case "user-not-found":
      res = trans.userNotFound;
      break;
    case "wrong-password":
      res = trans.wrongPassword;
      break;
    case "email-already-in-use":
      res = trans.emailAlreadyUse;
      break;
    case "account-exists-with-different-credential":
      res = trans.accountExists;
      break;
    case "Account information is incorrect!":
      res = trans.wrongPassword;
      break;
    case "Email was registered!":
      res = trans.emailAlreadyUse;
      break;
    case '"email" must be a valid email':
      res = trans.invalid;
      break;
    default:
      res = trans.userNotFound;
  }
  return res;
}

const List<String> listLanguages = ["en", "vi"];

//API
const String signinPath = "user/sign-in";
const String refreshTokenPath = "user/refresh-token";
const String getProfilePath = "user/profile?id=";
const String signupPath = "user/sign-up";
const String sendMailPath = "mail/send-verification-code";
const String verifyPath = "mail/verify-code";
const String categoriesPath = "food-hub/categories";
const String restaurantsPath = "food-hub/restaurants";
const String restaurantDetailPath = "food-hub/restaurant";
const String distDetailPath = "food-hub/dish?id=";

const String baseURL = "https://common-api-v1.vercel.app/";

//item
List<Map> drawerItems = [
  {'icon': CustomIcons.document, 'title': 'My Orders'},
  {'icon': CustomIcons.profile, 'title': 'My Profile'},
  {'icon': CustomIcons.location, 'title': 'Delivery Address'},
  {'icon': CustomIcons.wallet, 'title': 'Payment Methods'},
  {'icon': CustomIcons.message, 'title': 'Contact Us'},
  {'icon': CustomIcons.setting, 'title': 'Settings'},
  {'icon': CustomIcons.helps, 'title': 'Helps & FAQs'},
];

//
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
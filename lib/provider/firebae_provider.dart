import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub/Screens/main_screen.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/controller/login_controller.dart';
import 'package:food_hub/router/app_router.gr.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authProvider  = Provider((ref) => FirebaseAuth.instance);
final googleProvider  = Provider((ref) => GoogleSignIn());
final facebookProvider = Provider((ref) => FacebookAuth.instance);

  void authStateChange(BuildContext context) {
     FirebaseAuth.instance.authStateChanges().listen((data) {
      if (data != null) {
       Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.id, ModalRoute.withName(MainScreen.id));
      } else {
        return;
      }
    });
  }

  void stateChange(WidgetRef ref,BuildContext context) {
      bool isLogin = ref.watch(isLoginProvider);
      if(isLogin) {
        router.replaceAll([const MainRoute()]);
      }
      else {
        return;
      }
  }
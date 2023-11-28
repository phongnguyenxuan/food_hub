import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub/Screens/home_screen.dart';
import 'package:food_hub/Screens/verify_screen.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/provider/firebae_provider.dart';
import 'package:food_hub/widgets/custom_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:style/default_color.dart';

import '../Screens/welcome_screen.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService(
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleProvider),
    facebookAuth: ref.read(facebookProvider)));

class AuthService {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  AuthService(
      {required FirebaseAuth auth,
      required GoogleSignIn googleSignIn,
      required FacebookAuth facebookAuth})
      : _auth = auth,
        _googleSignIn = googleSignIn,
        _facebookAuth = facebookAuth;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  User? get user => _auth.currentUser;
  //Sign up with email
  Future<void> signUpWithEmail(
    String displayName,
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      EasyLoading.show();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        _auth.currentUser?.updateDisplayName(displayName);
        sendEmailVerification(context);
        return value;
      });
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (context.mounted) {
        showMessage(e.code, context);
      }
    }
  }

  showMessage(String code, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: DefaultColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            "Oops!!",
            style: TextStyle(fontFamily: fontFamily, color: DefaultColors.primaryColor),
          ),
          content: Text(
            errorMessage(code),
            style: const TextStyle(fontFamily: fontFamily, color: DefaultColors.blackColor),
          ),
          actions: <Widget>[
            CustomButton(
              color: DefaultColors.primaryColor,
              radius: 27,
              child: Text(
                trans.approve,
                style:
                    const TextStyle(fontFamily: fontFamily, color: DefaultColors.whiteColor),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //login with email
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      EasyLoading.show();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        EasyLoading.dismiss();
        showMessage(e.code, context);
      }
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      if ((_auth.currentUser?.emailVerified == false)) {
        _auth.currentUser?.sendEmailVerification();
        Navigator.pushNamed(context, VerifyScreen.id);
      } else {
        Navigator.pushNamed(context, HomeScreen.id);
      }
      return;
    } on FirebaseAuthException catch (_) {
      // Display error message
    }
  }

//Forgot password
  Future<void> forgotPassword(BuildContext context, String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email).then((value) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: DefaultColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: const Text(
                "Check your email",
                style: TextStyle(fontFamily: fontFamily, color: DefaultColors.primaryColor),
              ),
              content: Text(
                "We've sent password reset instructions to:\n$email",
                style:
                    const TextStyle(fontFamily: fontFamily, color: DefaultColors.blackColor),
              ),
              actions: <Widget>[
                CustomButton(
                  color: DefaultColors.primaryColor,
                  radius: 27,
                  child: Text(
                    trans.approve,
                    style: const TextStyle(
                        fontFamily: fontFamily, color: DefaultColors.whiteColor),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    } catch (_) {}
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      EasyLoading.show();
      await _googleSignIn.signOut();
      _googleSignIn.disconnect();
      await _auth.signOut();
      await _facebookAuth.logOut();
      EasyLoading.dismiss();
      if (!context.mounted) return;
      Navigator.of(context).pushNamedAndRemoveUntil(
          WelcomeScreen.id, ModalRoute.withName(WelcomeScreen.id));
    } on FirebaseAuthException catch (_) {}
  }

  // GOOGLE SIGN IN
  Future<void> logInWithGoogle(BuildContext context) async {
    try {
      //loading
      EasyLoading.show();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      EasyLoading.dismiss();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      if (context.mounted) firebaseSignInWithCredential(credential, context);
    } on FirebaseAuthException catch (_) {}
  }

  //Facebook login
  Future<void> logInWithFacebook(BuildContext context) async {
    final LoginResult result =
        await _facebookAuth.login(permissions: ['email', 'public_profile']);
    if (result.status == LoginStatus.success) {
      final credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      if (context.mounted) firebaseSignInWithCredential(credential, context);
    }
  }

  firebaseSignInWithCredential(
      OAuthCredential credential, BuildContext context) async {
    try {
      //loading
      EasyLoading.show();
      await _auth.signInWithCredential(credential);
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Future(() {
        showMessage(e.code, context);
      });
    }
  }
}

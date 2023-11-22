import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub/services/auth_service.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authService: ref.watch(authServiceProvider),
  ),
);

class AuthController extends StateNotifier<bool> {
  final AuthService _authService;

  AuthController({required AuthService authService})
      : _authService = authService,
        super(false);

  Stream<User?> get authStateChange => _authService.authStateChange;

  User? get user => _authService.user;

  Future<void> signUpWithEmail(String displayName, String email,
      String password, BuildContext context) async {
    await _authService.signUpWithEmail(displayName, email, password, context);
  }

  Future<void> loginWithEmail(
      String email, String password, BuildContext context) async {
    await _authService.loginWithEmail(
        email: email, password: password, context: context);
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    await _authService.sendEmailVerification(context);
  }

  Future<void> signOut(BuildContext context) async {
    await _authService.signOut(context);
  }

  void logInWithGoogle(BuildContext context) async {
    state = true;
    await _authService.logInWithGoogle(context);
    state = false;
  }

  Future<void> logInWithFacebook(BuildContext context) async {
    await _authService.logInWithFacebook(context);
  }

  Future<void> forgotPassword(BuildContext context, String email) async {
    await _authService.forgotPassword(context, email);
  }
}

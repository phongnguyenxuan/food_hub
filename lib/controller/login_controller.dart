import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/hive_service.dart';

final hiveProvider = Provider<HiveService>((ref) => HiveService());

class LoginController extends StateNotifier<bool?> {
  LoginController(this.ref) : super(null) {
    getLogin();
  }
  final StateNotifierProviderRef ref;
  late HiveService? service = ref.read(hiveProvider);

  void getLogin() {
    state = service?.getAccessToken()?.isNotEmpty ;
  }

  void setLogin(bool isLogin) {
    state = isLogin;
  }
}

final loginProvider = StateNotifierProvider<LoginController, bool?>((ref) {
  return LoginController(ref);
});

final isLoginProvider = Provider<bool>((ref) {
  final isLogProvider = ref.watch(loginProvider);
  return isLogProvider ?? false;
});
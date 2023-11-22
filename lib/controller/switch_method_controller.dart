
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/hive_service.dart';


final hiveProvider= Provider<HiveService>((ref) => HiveService());

class SwitchController extends StateNotifier<bool?>{
  SwitchController(this.ref) : super(null) {  
   getSwitchMethod();
  }

  final StateNotifierProviderRef ref;
  late HiveService? service = ref.read(hiveProvider);
  void getSwitchMethod() {
    state = service?.getSwitchMethod();
  }

  void updateSwitch(bool isActive) {
    state = service?.updateSwitchMethod(isActive);
  }
}

final switchProvider =
    StateNotifierProvider<SwitchController, bool?>((ref) => SwitchController(ref));

final getswitchProvider = Provider<bool>((ref) {
  final sProvider = ref.watch(switchProvider);
  return sProvider ?? false;
});
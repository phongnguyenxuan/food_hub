
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub/configs/constant_varible.dart';

import '../services/hive_service.dart';




final hiveProvider= Provider<HiveService>((ref) => HiveService());

class LanguageController extends StateNotifier<String?>{
  LanguageController(this.ref) : super(null) {  
   getLanguage();
  }

  final StateNotifierProviderRef ref;
  late HiveService? service = ref.read(hiveProvider);
  void getLanguage() {
    state = service?.getLanguage();
  }

  void updateLanguage(String lang) {
    state = service?.updateLanguage(lang);
  }
}

final languageProvider =
    StateNotifierProvider<LanguageController, String?>((ref) => LanguageController(ref));

final getLanguageProvider = Provider<String>((ref) {
  final langProvider = ref.watch(languageProvider);
  return langProvider ?? defaultLanguage;
});
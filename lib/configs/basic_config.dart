import 'dart:io';

import 'package:food_hub/configs/constant_varible.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future setupHive() async {
  Directory documents = await getApplicationDocumentsDirectory();
  Hive.init(documents.path);
  await Hive.openBox(boxAppSettingName);
  await Hive.openBox(boxAPIName);
}
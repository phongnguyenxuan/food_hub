// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountExists": MessageLookupByLibrary.simpleMessage(
            "Tài khoản đã tồn tại với cùng một địa chỉ email"),
        "alreadyHave":
            MessageLookupByLibrary.simpleMessage("Bạn đã có tài khoản? "),
        "approve": MessageLookupByLibrary.simpleMessage("Chấp nhận"),
        "blank":
            MessageLookupByLibrary.simpleMessage("Đầu vào không được để trống"),
        "dontHave":
            MessageLookupByLibrary.simpleMessage("Bạn chưa có tài khoản?"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "emailAlreadyUse": MessageLookupByLibrary.simpleMessage(
            "Email đã được sử dụng trên một tài khoản khác"),
        "forgot": MessageLookupByLibrary.simpleMessage("Quên mật khẩu?"),
        "fullName": MessageLookupByLibrary.simpleMessage("Họ và tên"),
        "invalid": MessageLookupByLibrary.simpleMessage("Email không hợp lệ"),
        "mailMessage": MessageLookupByLibrary.simpleMessage(
            "Email hoặc điện thoại của bạn"),
        "nameMessage": MessageLookupByLibrary.simpleMessage("Tên bạn"),
        "pass": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "passValidator": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu phải có ít nhất 8 ký tự, ít nhất 1 chữ in hoa, 1 số và 1 ký tự đặc biệt"),
        "signIn": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "signUp": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "signinWith": MessageLookupByLibrary.simpleMessage("Đăng nhập với"),
        "startWith": MessageLookupByLibrary.simpleMessage(
            "Bắt đầu bằng email\nhoặc điện thoại"),
        "userDisabled":
            MessageLookupByLibrary.simpleMessage("Email đã bị vô hiệu hóa"),
        "userNotFound": MessageLookupByLibrary.simpleMessage(
            "Email hoặc mật khẩu của bạn không chính xác"),
        "welcome": MessageLookupByLibrary.simpleMessage("Chào mừng bạn đến"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "Email hoặc mật khẩu của bạn không chính xác"),
        "yourFavourite": MessageLookupByLibrary.simpleMessage(
            "Thực phẩm yêu thích của bạn được giao nhanh chóng tại cửa của bạn.")
      };
}

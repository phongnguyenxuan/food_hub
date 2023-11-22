// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountExists": MessageLookupByLibrary.simpleMessage(
            "Account already exists with the same email address"),
        "alreadyHave":
            MessageLookupByLibrary.simpleMessage("Already have an account? "),
        "approve": MessageLookupByLibrary.simpleMessage("Approve"),
        "blank": MessageLookupByLibrary.simpleMessage("Field can\'t be blank"),
        "dontHave":
            MessageLookupByLibrary.simpleMessage("Don’t have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "emailAlreadyUse": MessageLookupByLibrary.simpleMessage(
            "Email already use on another account"),
        "forgot": MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full name"),
        "invalid": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "mailMessage":
            MessageLookupByLibrary.simpleMessage("Your email or phone"),
        "nameMessage": MessageLookupByLibrary.simpleMessage("Your name"),
        "pass": MessageLookupByLibrary.simpleMessage("Password"),
        "passValidator": MessageLookupByLibrary.simpleMessage(
            "Password must has at least 8 characers, at least 1 capital letter, 1 number and 1 special character"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "signinWith": MessageLookupByLibrary.simpleMessage("Sign in with"),
        "startWith":
            MessageLookupByLibrary.simpleMessage("Start with email or phone"),
        "userDisabled":
            MessageLookupByLibrary.simpleMessage("Email has been disabled"),
        "userNotFound": MessageLookupByLibrary.simpleMessage(
            "Your email or password not correct"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome to"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "Your email or password not correct"),
        "yourFavourite": MessageLookupByLibrary.simpleMessage(
            "Your favourite foods delivered\nfast at your door.")
      };
}

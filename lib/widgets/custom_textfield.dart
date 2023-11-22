import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/configs/style.dart';
import 'package:food_hub/custom_icons_icons.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
       this.title,
       this.padding,
      this.hintText,
      this.haveSurffixIcon = false,
      required this.controller,
      this.error,
      this.formKey, this.textInputType});
  final String? title;
  final String? hintText;
  final EdgeInsets? padding;
  final bool haveSurffixIcon;
  final TextEditingController controller;
  final String? error;
  final GlobalKey<FormState>? formKey;
  final TextInputType? textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = false;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
         widget.title != null ? Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Text(
              widget.title!,
              style: titleTextFieldStyle,
            ),
          ) : Container(),
          //TextField
          TextFormField(
            controller: widget.controller,
            obscureText: _isObscure,
            cursorColor: kPrimaryColor,
            keyboardType: widget.textInputType,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return trans.blank;
              } else {
                if (widget.haveSurffixIcon) {
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regExp = RegExp(pattern);
                  if (!regExp.hasMatch(value)) {
                    return trans.passValidator;
                  }
                  return null;
                }
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: widget.hintText,
              errorMaxLines: 2,
              errorStyle: TextStyle(
                  fontSize: 11.sp, color: Colors.red, fontFamily: fontFamily),
              suffixIcon: widget.haveSurffixIcon
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      child: Icon(
                        CustomIcons.eye,
                        size: 15.sp,
                        color: kSurffixColor,
                      ),
                    )
                  : null,
              hintStyle: hintTextStyle,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: kPrimaryColor)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: kBoderTextFieldDefault)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: Colors.red)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: kBoderTextFieldDefault)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: kPrimaryColor)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: kPrimaryColor)),
            ),
          )
        ],
      ),
    );
  }
}

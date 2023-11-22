import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/configs/style.dart';
import 'package:food_hub/custom_icons_icons.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: "Find for food or restaurant...",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
          color: kHintSearchColor
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Icon(
            CustomIcons.search,
            color: kSearchColor,
            ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: kSearchBorderColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(width: 1, color: kSearchBorderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: kSearchBorderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(width: 1, color: kSearchBorderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: kSearchBorderColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: kSearchBorderColor)),
      ),
    );
  }
}

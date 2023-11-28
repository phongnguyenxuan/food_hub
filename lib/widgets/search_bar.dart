import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/custom_icons_icons.dart';
import 'package:style/default_color.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: DefaultColors.primaryColor,
      decoration: InputDecoration(
        hintText: "Find for food or restaurant...",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
          color: DefaultColors.hintSearchColor
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Icon(
            CustomIcons.search,
            color: DefaultColors.searchColor,
            ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: DefaultColors.searchBorderColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(width: 1, color: DefaultColors.searchBorderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: DefaultColors.searchBorderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(width: 1, color: DefaultColors.searchBorderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: DefaultColors.searchBorderColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: DefaultColors.searchBorderColor)),
      ),
    );
  }
}

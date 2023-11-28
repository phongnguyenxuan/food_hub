import 'package:flutter/material.dart';
import 'package:style/default_color.dart';

import '../../configs/constant_varible.dart';
import '../../widgets/custom_button.dart';

class ShowMessage extends StatelessWidget {
  final String code;
  const ShowMessage({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: DefaultColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      title: const Text(
        "Oops!!",
        style: TextStyle(
            fontFamily: fontFamily, color: DefaultColors.primaryColor),
      ),
      content: Text(
        errorMessage(code),
        style: const TextStyle(
            fontFamily: fontFamily,
            color: DefaultColors.blackColor,
            fontSize: 15),
      ),
      actions: <Widget>[
        CustomButton(
          color: DefaultColors.primaryColor,
          radius: 27,
          child: Text(
            trans.approve,
            style: const TextStyle(
                fontFamily: fontFamily, color: DefaultColors.whiteColor),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

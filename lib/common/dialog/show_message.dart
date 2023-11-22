import 'package:flutter/material.dart';

import '../../configs/constant_varible.dart';
import '../../configs/style.dart';
import '../../widgets/custom_button.dart';

class ShowMessage extends StatelessWidget {
  final String code;
  const ShowMessage({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
          backgroundColor: kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          title: const Text(
            "Oops!!",
            style: TextStyle(fontFamily: fontFamily, color: kPrimaryColor),
          ),
          content: Text(
            errorMessage(code),
            style: const TextStyle(fontFamily: fontFamily, color: kBlackColor, fontSize: 15),
          ),
          actions: <Widget>[
            CustomButton(
              color: kPrimaryColor,
              radius: 27,
              child: Text(
                trans.approve,
                style:
                    const TextStyle(fontFamily: fontFamily, color: kWhiteColor),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
  }
}
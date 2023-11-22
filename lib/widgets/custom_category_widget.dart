import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/configs/style.dart';

class CustomCategoryWidget extends StatelessWidget {
  const CustomCategoryWidget(
      {Key? key,
      required this.backgroundColor,
      required this.shadowColor,
      required this.imagePath,
      required this.title,
      required this.textColor,
      this.onPressed})
      : super(key: key);
  final Color backgroundColor;
  final Color shadowColor;
  final String imagePath;
  final String title;
  final Color textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 2),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: kPrimaryColor,
              elevation: 2,
              shadowColor: shadowColor,
              padding: const EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 29,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CachedNetworkImage(
                      imageUrl: imagePath,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            color: kPrimaryColor,
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 11.76.h,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          )),
    );
  }
}

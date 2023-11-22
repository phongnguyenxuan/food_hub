import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/constant_varible.dart';

import '../configs/style.dart';
import '../custom_icons_icons.dart';

class CustomDishWidget extends ConsumerWidget {
  const CustomDishWidget(this.dishName, this.imageUrl, this.price,
      this.reviewCount, this.reviewStar,
      {super.key});
  final String dishName;
  final String imageUrl;
  final double price;
  final int reviewCount;
  final double reviewStar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 239,
      margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.21),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3FD3D1D8),
            blurRadius: 36.43,
            offset: Offset(18.21, 18.21),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 220.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.21),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "${assetsImagesPath}heart.png",
                      width: 80,
                      height: 80,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                      margin: const EdgeInsets.only(bottom: 10, left: 10),
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x33FE724C),
                              blurRadius: 23.39,
                              offset: Offset(0, 5.85),
                              spreadRadius: 0,
                            )
                          ]),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "$reviewStar",
                            style: TextStyle(
                                fontSize: 11.69.sp,
                                fontFamily: fontFamily,
                                color: kTextBlackColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4.2, vertical: 1),
                            child: Icon(
                              CustomIcons.star,
                              color: kYellowColor,
                              size: 11.69.sp,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 1),
                            child: Text(
                              "($reviewCount+)",
                              style: const TextStyle(
                                color: Color(0xFF9796A1),
                                fontSize: 8.50,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  dishName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.21,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RichText(
                  text: TextSpan(
                      text: '\$',
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                      children: [
                        TextSpan(
                          text: price.toString(),
                          style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 18,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

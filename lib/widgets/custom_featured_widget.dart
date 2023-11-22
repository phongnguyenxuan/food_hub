import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/Screens/restaurant_detail_screen.dart';
import 'package:food_hub/configs/style.dart';
import 'package:food_hub/controller/api_controller.dart';
import 'package:food_hub/custom_icons_icons.dart';
import 'package:food_hub/models/food_hub/restaurants_model.dart';
import 'package:food_hub/router/app_router.gr.dart';

import '../configs/constant_varible.dart';

class CustomFeaturedWidget extends ConsumerWidget {
  const CustomFeaturedWidget({super.key, required this.restaurantsModel});
  final RestaurantsModel restaurantsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<dynamic> tags = jsonDecode(restaurantsModel.tags);
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 2),
      child: SizedBox(
        width: 266.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: kWhiteColor,
              shadowColor: kWhiteShadowColor,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: () async {
            await ref
                .read(apiControlProvider.notifier)
                .getRestaurantDetail(restaurantsModel.id)
                .then((value) {
              router.push(RestaurantDetailRoute(restaurantModel: value!));
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 266.w,
                    height: 136.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: CachedNetworkImage(
                        imageUrl: restaurantsModel.backgroundImageUrl,
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 9),
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                  color: kOrangeShadowColor, blurRadius: 2.3)
                            ]),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${restaurantsModel.reviewStar}",
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
                                "(${restaurantsModel.reviewCount}+)",
                                style: TextStyle(
                                  fontFamily: fontFamily,
                                  fontSize: 8.19.sp,
                                  color: kGreyColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 50.w,
                        height: 38.h,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("${assetsImagesPath}heart.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              //
              Padding(
                padding: const EdgeInsets.only(left: 13, bottom: 6, top: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      restaurantsModel.restaurantName,
                      style: TextStyle(
                          color: kTextBlackColor,
                          fontFamily: fontFamily,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    restaurantsModel.verify
                        ? const SizedBox(
                            width: 10,
                            child: Icon(
                              Icons.check_circle_rounded,
                              color: kGreenColor,
                              size: 15,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, bottom: 17.57),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    restaurantsModel.deliveryDescription["delivery_fee"] ==
                            "true"
                        ? Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Row(
                              children: [
                                const Icon(
                                  CustomIcons.ship,
                                  color: kPrimaryColor,
                                  size: 16,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 6, top: 6),
                                  child: Text(
                                    "Free delivery",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: k400GreyColor,
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        const Icon(
                          CustomIcons.time,
                          color: kPrimaryColor,
                          size: 16,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            restaurantsModel
                                .deliveryDescription["delivery_time"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: k400GreyColor,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: List<Widget>.generate(
                    tags.length,
                    (index) => Container(
                          decoration: BoxDecoration(
                              color: k0xFFF6F6F6,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(
                              left: 7, right: 7, bottom: 14),
                          child: Text(
                            tags[index],
                            style: k12w400whiteColor,
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

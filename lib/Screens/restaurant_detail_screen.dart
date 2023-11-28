import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/models/food_hub/dish_model.dart';
import 'package:food_hub/models/food_hub/restaurant_model.dart';
import 'package:food_hub/router/app_router.gr.dart';
import 'package:food_hub/widgets/custom_dish.dart';

import '../configs/constant_varible.dart';
import '../configs/style.dart';
import '../controller/api_controller.dart';
import '../custom_icons_icons.dart';
import '../widgets/custom_button.dart';

@RoutePage()
class RestaurantDetailScreen extends ConsumerStatefulWidget {
  const RestaurantDetailScreen(this.restaurantModel, {super.key});
  static const String id = "restaurant detail";
  final RestaurantModel restaurantModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState
    extends ConsumerState<RestaurantDetailScreen> {
  late List<DishModel> listDish;
  List<String> listDropItem = ['Price', 'Review', 'Star'];
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    listDish = List.from(widget.restaurantModel.dishs);
    dropdownValue = listDropItem.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          header(context),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: List<Widget>.generate(listDish.length, (index) {
                  DishModel dishModel = listDish[index];
                  return InkWell(
                    radius: 2,
                    onTap: () async {
                      await ref
                          .read(apiControlProvider.notifier)
                          .getDishDetail(dishModel.id)
                          .then((value) {
                        router.push(DishDetailRoute(
                          imageUrl: value?.imageUrl,
                          dishName: value?.dishName,
                          description: value?.description,
                          price: value?.price,
                          reviewCount: value?.reviewCount,
                          reviewStar: value?.reviewStar,
                          listTopping: value?.toppings,
                        ));
                      });
                    },
                    child: CustomDishWidget(
                        dishModel.dishName,
                        dishModel.imageUrl,
                        dishModel.price,
                        dishModel.reviewCount,
                        dishModel.reviewStar),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar header(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kWhiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      pinned: true,
      snap: false,
      floating: false,
      stretch: false,
      title: Container(
        margin: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                color: kWhiteColor,
                padding: const EdgeInsets.all(10),
                radius: 15,
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: kBlackColor,
                ),
              ),
            ),
            const Spacer(),
            Image.asset(
              "${assetsImagesPath}heart.png",
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
      expandedHeight: 290,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Container(
          //color: Colors.red,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3FD3D1D8),
                  blurRadius: 30,
                  offset: Offset(15, 15),
                  spreadRadius: 0,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: widget.restaurantModel.backgroundImageUrl,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      color: kPrimaryColor, value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Container(
          color: kWhiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 15, right: 15, top: 0, bottom: 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3FD3D1D8),
                      blurRadius: 30,
                      offset: Offset(15, 15),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    //avatar
                    Container(
                      width: 65,
                      height: 65,
                      padding: const EdgeInsets.all(9.29),
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(11.5),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x72D3D1D8),
                              blurRadius: 22.96,
                              offset: Offset(11.48, 17.22),
                              spreadRadius: 0,
                            )
                          ]),
                      child: CachedNetworkImage(
                        imageUrl: widget.restaurantModel.restaurantImageUrl,
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
                    const SizedBox(
                      width: 8,
                    ),
                    //name
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            widget.restaurantModel.restaurantName,
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 28,
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.w600,
                              height: 0.04,
                              letterSpacing: -0.56,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 9),
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
                                    "${widget.restaurantModel.reviewStar}",
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
                                      "(${widget.restaurantModel.reviewCount}+)",
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
                            const SizedBox(
                              width: 9,
                            ),
                            widget.restaurantModel.verify
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: kGreenColor,
                                    size: 20,
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    Text(
                      'Short by:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF111719),
                        fontSize: 14.sp,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    shortBy(),
                    const Spacer(),
                    const Icon(
                      CustomIcons.search,
                      size: 15,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 39,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton<String> shortBy() {
    return DropdownButton(
      underline: Container(),
      borderRadius: BorderRadius.circular(15),
      elevation: 2,
      value: dropdownValue,
      items: listDropItem.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFFFE724C),
              fontSize: 14,
              fontFamily: 'Sofia Pro',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          dropdownValue = value!;
          switch (value) {
            case 'Price':
              listDish.sort(
                  (DishModel a, DishModel b) => a.price.compareTo(b.price));
              break;
            case 'Review':
              listDish.sort((DishModel a, DishModel b) =>
                  b.reviewCount.compareTo(a.reviewCount));
              break;
            case 'Star':
              listDish.sort((DishModel a, DishModel b) =>
                  b.reviewStar.compareTo(a.reviewStar));
              break;
            default:
              listDish = List.from(widget.restaurantModel.dishs);
              break;
          }
        });
      },
    );
  }
}

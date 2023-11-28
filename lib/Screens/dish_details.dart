import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/router/app_router.gr.dart';
import 'package:style/default_color.dart';

import '../configs/constant_varible.dart';
import '../custom_icons_icons.dart';
import '../models/food_hub/topping_model.dart';
import '../widgets/custom_button.dart';

@RoutePage()
class DishDetailScreen extends StatefulWidget {
  final String? imageUrl;
  final String? dishName;
  final String? description;
  final double? price;
  final int? reviewCount;
  final double? reviewStar;
  final List<ToppingModel>? listTopping;
  const DishDetailScreen(
      {super.key,
      required this.imageUrl,
      required this.dishName,
      required this.description,
      required this.price,
      required this.reviewCount,
      required this.reviewStar,
      this.listTopping});

  @override
  // ignore: library_private_types_in_public_api
  _DishDetailsState createState() => _DishDetailsState();
}

class _DishDetailsState extends State<DishDetailScreen> {
  int quantity = 1;
  List<bool> checkedTopping = [];
  @override
  void initState() {
    super.initState();
    checkedTopping =
        List<bool>.generate(widget.listTopping!.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.whiteColor,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              header(context),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            CustomIcons.star,
                            color: DefaultColors.yellowColor,
                            size: 18.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "${widget.reviewStar}",
                              style: const TextStyle(
                                color: Color(0xFF111719),
                                fontSize: 14,
                                fontFamily: 'Sofia Pro',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                          Text(
                            "(${widget.reviewCount}+)",
                            style: const TextStyle(
                              color: Color(0xFF9796A1),
                              fontSize: 14,
                              fontFamily: 'Sofia Pro',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          const Text(
                            'See Review',
                            style: TextStyle(
                              color: Color(0xFFFE724C),
                              fontSize: 13,
                              fontFamily: 'Sofia Pro',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                    color: Color(0xFFFE724C),
                                    fontSize: 17.01,
                                    fontFamily: 'Sofia Pro',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.price.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFFFE724C),
                                    fontSize: 31,
                                    fontFamily: 'Sofia Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              minusButton(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 9),
                                child: Text(
                                  '$quantity',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                              addButton(),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //description
                      Text(
                        '${widget.description}',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Color(0xFF858891),
                          fontSize: 15,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 22, 0, 5),
                        child: Text(
                          'Choice of Add On',
                          style: TextStyle(
                            color: Color(0xFF323643),
                            fontSize: 18,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Column(
                        children: List<Widget>.generate(
                          widget.listTopping!.length,
                          (index) {
                            ToppingModel toppingModel =
                                widget.listTopping![index];
                            return topingWidget(toppingModel, index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

          //add to cart
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 167,
              height: 53,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: ShapeDecoration(
                color: DefaultColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.50),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x33FE724C),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  router.pushAndPopUntil(const CartRoute(), predicate:(route) => false,);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: DefaultColors.primaryColor,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.50),
                    )),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.fromLTRB(6, 0, 15, 0),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        CustomIcons.shop_1,
                        color: DefaultColors.primaryColor,
                      ),
                    ),
                    const Text(
                      'Add to cart ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container topingWidget(ToppingModel toppingModel, int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 25, 9),
      child: Row(
        children: [
          SizedBox(
            width: 50.75,
            height: 48.08,
            child: CachedNetworkImage(
              imageUrl: toppingModel.imageUrl,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                    color: DefaultColors.primaryColor, value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            toppingModel.toppingName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          const Spacer(),
          Text(
            '+\$${toppingModel.price}',
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          IconButton(
            splashRadius: 15,
            onPressed: () {
              setState(() {
                checkedTopping[index] = !checkedTopping[index];
              });
            },
            icon: Icon(
              checkedTopping[index]
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_off_rounded,
              color: checkedTopping[index]
                  ? DefaultColors.primaryColor
                  : const Color(0xD4D5DAB2),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector addButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          quantity++;
        });
      },
      child: SizedBox(
        width: 30.60,
        height: 30.60,
        child: Container(
          width: 30.60,
          height: 30.60,
          decoration: ShapeDecoration(
            color: DefaultColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x40FE724C),
                blurRadius: 30,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  GestureDetector minusButton() {
    return GestureDetector(
      onTap: () {
        if (quantity > 1) {
          setState(() {
            quantity--;
          });
        }
      },
      child: SizedBox(
        width: 30.60,
        height: 30.60,
        child: Container(
          width: 30.60,
          height: 30.60,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: DefaultColors.primaryColor),
              borderRadius: BorderRadius.circular(17),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0xFFEEF0F2),
                blurRadius: 30,
                offset: Offset(0, 20),
                spreadRadius: 0,
              )
            ],
          ),
          child: const Icon(
            Icons.remove,
            color: DefaultColors.primaryColor,
          ),
        ),
      ),
    );
  }

  SliverAppBar header(BuildContext context) {
    return SliverAppBar(
      backgroundColor: DefaultColors.whiteColor,
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
                color: DefaultColors.whiteColor,
                padding: const EdgeInsets.all(10),
                radius: 15,
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: DefaultColors.blackColor,
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
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 50),
          child: Container(
            decoration: BoxDecoration(
              color: DefaultColors.whiteColor,
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
                imageUrl: widget.imageUrl!,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      color: DefaultColors.primaryColor, value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 20, bottom: 13),
          child: Text(
            widget.dishName!,
            style: const TextStyle(
              color: Color(0xFF323643),
              fontSize: 28,
              fontFamily: 'Sofia Pro',
              fontWeight: FontWeight.w600,
              height: 0.04,
              letterSpacing: -0.56,
            ),
          ),
        ),
      ),
    );
  }
}

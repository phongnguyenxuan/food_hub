import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/models/food_hub/categories_model.dart';
import 'package:food_hub/models/food_hub/restaurants_model.dart';
import 'package:food_hub/widgets/custom_button.dart';
import 'package:food_hub/widgets/custom_category_widget.dart';
import 'package:food_hub/widgets/custom_featured_widget.dart';
import 'package:style/default_color.dart';
import 'package:style/default_text_style.dart';

import '../controller/api_controller.dart';
import '../models/user/user_model.dart';
import '../widgets/search_bar.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const String id = "Home screen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = ref.watch(userController);
    List<CategoriesModel>? listCate = ref.watch(categoryController);
    List<RestaurantsModel>? listRes = ref.watch(restaurantsController);
    //User? user = FirebaseAuth.instance.currentUser;
    return Builder(
      builder: (context) {
        if (userModel == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: DefaultColors.primaryColor,
            ),
          );
        }
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 30),
                child: Text(
                  whatWould,
                  style: DefaultTextStyles.titleHomeTextStyle,
                ),
              ),
              SizedBox(height: 19.h),
              Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: CustomSearchBar(),
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: SizedBox(
                      width: 51.w,
                      child: CustomButton(
                          shadowColor: DefaultColors.greyShadowColor,
                          elevation: 2,
                          padding: const EdgeInsets.all(15),
                          color: DefaultColors.whiteColor,
                          radius: 14,
                          child: Image.asset(switchAssetsPath)),
                    ),
                  )
                ],
              ),

              //category
              SizedBox(
                height: 30.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List<Widget>.generate(listCate!.length, (index) {
                    return CustomCategoryWidget(
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        backgroundColor: selectedIndex == index
                            ? DefaultColors.primaryColor
                            : DefaultColors.whiteColor,
                        shadowColor: selectedIndex == index
                            ? DefaultColors.orangeShadowColor
                            : DefaultColors.whiteShadowColor,
                        textColor: selectedIndex == index
                            ? DefaultColors.whiteColor
                            : DefaultColors.blackCateColor,
                        imagePath: listCate[index].imageUrl,
                        title: listCate[index].categoryName);
                  }),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    const Text(
                      "Featured Restaurants",
                      style: DefaultTextStyles.titleHomeStyle,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View All >",
                            style: DefaultTextStyles.viewAllStyle,
                          )),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List<Widget>.generate(
                    listRes!.length,
                    (index) {
                      return CustomFeaturedWidget(
                        restaurantsModel: listRes[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

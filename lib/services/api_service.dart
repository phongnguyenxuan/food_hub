import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_hub/Screens/main_screen.dart';
import 'package:food_hub/Screens/verify_screen.dart';
import 'package:food_hub/common/dialog/show_message.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/models/food_hub/categories_model.dart';
import 'package:food_hub/models/food_hub/dish_model.dart';
import 'package:food_hub/models/food_hub/restaurants_model.dart';
import 'package:food_hub/models/user/user_model.dart';
import 'package:food_hub/services/hive_service.dart';
import 'package:retrofit/http.dart';

import '../models/food_hub/restaurant_model.dart';
import '../models/response/response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseURL)
abstract class APIService {

  factory APIService(
    {String baseUrl}) = _APIService;

  @POST(signinPath)
   Future<UserModel?> signIn(String email, String password, BuildContext context);

  @POST(signupPath)
   Future<UserModel?> signUp(String userName, String email, String password, BuildContext context);

  @GET(getProfilePath)
  Future<UserModel?> getProfile();

  @POST(sendMailPath)
  Future<void> sendVerification(String email);

  @POST(verifyPath)
  Future<void> verification(String code, BuildContext context);

  Future<void> logOut();

  @GET(categoriesPath)
  Future<List<CategoriesModel>?>getCategories();

  @GET(restaurantsPath)
  Future<List<RestaurantsModel>?>getRestaurants();

  @GET(restaurantDetailPath)
  Future<RestaurantModel?>getRestaurantDetail(String id);

 @GET(distDetailPath)
  Future<DishModel?>getDishDetail(String id);
}

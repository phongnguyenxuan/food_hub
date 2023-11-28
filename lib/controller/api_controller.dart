import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub/configs/constant_varible.dart';
import 'package:food_hub/controller/login_controller.dart';
import 'package:food_hub/models/food_hub/categories_model.dart';
import 'package:food_hub/models/food_hub/dish_model.dart';
import 'package:food_hub/models/food_hub/restaurant_model.dart';
import 'package:food_hub/models/food_hub/restaurants_model.dart';
import 'package:food_hub/router/app_router.gr.dart';
import 'package:food_hub/services/api_service.dart';
import '../models/user/user_model.dart';

final apiServiceProvider = Provider<APIService>((ref) => APIService());

class ApiController extends StateNotifier<UserModel?> {
  final StateNotifierProviderRef ref;
  ApiController(this.ref) : super(null);
  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    EasyLoading.show();
    await ref
        .read(apiServiceProvider)
        .signIn(email, password, context)
        .then((value) async {
      if (value != null) {
        state = value;
        EasyLoading.show();
        await Future.wait([
          ref.read(cateControlProvider.notifier).getCategories(),
          ref.read(restaurantsControlProvider.notifier).getRestaurants(),
        ]).then((value) {
          EasyLoading.dismiss();
          ref.read(loginProvider.notifier).setLogin(true);
        });
      }
      EasyLoading.dismiss();
      return;
    });
  }

  Future<void> signUp(
      {required String userName,
      required String email,
      required String password,
      required BuildContext context}) async {
    EasyLoading.show();
    await ref
        .read(apiServiceProvider)
        .signUp(userName, email, password, context)
        .then((value) async {
      if (value != null) {
        state = value;
        EasyLoading.show();
        await Future.wait([
          ref.read(cateControlProvider.notifier).getCategories(),
          ref.read(restaurantsControlProvider.notifier).getRestaurants(),
        ]).then((value) {
          EasyLoading.dismiss();
          ref.read(loginProvider.notifier).setLogin(true);
        });
      }
      EasyLoading.dismiss();
      return;
    });
  }

  Future<void> logOut() async {
    ref.read(apiServiceProvider).logOut().then((value) =>
        router.pushAndPopUntil(const WelcomeRoute(), predicate:(route) => false,));
    ref.read(loginProvider.notifier).setLogin(false);
  }

  Future<void> getProfile() async {
    await ref.read(apiServiceProvider).getProfile().then((value) {
      if (value != null) {
        state = value;
      }
      return;
    });
  }

  Future<void> sendVerification({required String email}) async {
    await ref.read(apiServiceProvider).sendVerification(email);
  }

  Future<void> verification(
      {required code, required BuildContext context}) async {
    await ref.read(apiServiceProvider).verification(code, context);
  }

  Future<RestaurantModel?> getRestaurantDetail(String id) async {
    return await ref.read(apiServiceProvider).getRestaurantDetail(id);
  }

    Future<DishModel?> getDishDetail(String id) async {
    return await ref.read(apiServiceProvider).getDishDetail(id);
  }
}

class CategoryController extends StateNotifier<List<CategoriesModel>?> {
  final StateNotifierProviderRef ref;
  CategoryController(this.ref) : super(null);

  //Food hub
  Future<void> getCategories() async {
    await ref.read(apiServiceProvider).getCategories().then((value) {
      if (value != null) {
        state = value;
      }
      return;
    });
  }
}

class RestaurantsController extends StateNotifier<List<RestaurantsModel>?> {
  final StateNotifierProviderRef ref;
  RestaurantsController(this.ref) : super(null);

  //Food hub
  Future<void> getRestaurants() async {
    await ref.read(apiServiceProvider).getRestaurants().then((value) {
      if (value != null) {
        state = value;
      }
      return;
    });
  }
}

final apiControlProvider =
    StateNotifierProvider<ApiController, UserModel?>((ref) {
  return ApiController(ref);
});

final cateControlProvider =
    StateNotifierProvider<CategoryController, List<CategoriesModel>?>((ref) {
  return CategoryController(ref);
});

final restaurantsControlProvider =
    StateNotifierProvider<RestaurantsController, List<RestaurantsModel>?>(
        (ref) {
  return RestaurantsController(ref);
});

final userController = Provider<UserModel?>((ref) {
  final userProvider = ref.watch(apiControlProvider);
  return userProvider;
});

final categoryController = Provider<List<CategoriesModel>?>((ref) {
  final cateProvider = ref.watch(cateControlProvider);
  return cateProvider;
});

final restaurantsController = Provider<List<RestaurantsModel>?>((ref) {
  final resProvider = ref.watch(restaurantsControlProvider);
  return resProvider;
});

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:food_hub/models/food_hub/restaurant_model.dart' as _i19;
import 'package:food_hub/models/food_hub/topping_model.dart' as _i18;
import 'package:food_hub/Screens/cart_screen.dart' as _i1;
import 'package:food_hub/Screens/delivery_screen.dart' as _i2;
import 'package:food_hub/Screens/dish_details.dart' as _i3;
import 'package:food_hub/Screens/favorite_screen.dart' as _i4;
import 'package:food_hub/Screens/forgot_password.dart' as _i5;
import 'package:food_hub/Screens/home_screen.dart' as _i6;
import 'package:food_hub/Screens/login_screen.dart' as _i7;
import 'package:food_hub/Screens/main_screen.dart' as _i8;
import 'package:food_hub/Screens/notification_screen.dart' as _i9;
import 'package:food_hub/Screens/restaurant_detail_screen.dart' as _i10;
import 'package:food_hub/Screens/sign_up.dart' as _i11;
import 'package:food_hub/Screens/splash_screen.dart' as _i12;
import 'package:food_hub/Screens/switch_sigin_method.dart' as _i13;
import 'package:food_hub/Screens/verify_screen.dart' as _i14;
import 'package:food_hub/Screens/welcome_screen.dart' as _i15;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CartScreen(),
      );
    },
    DeliveryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DeliveryScreen(),
      );
    },
    DishDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DishDetailRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DishDetailScreen(
          key: args.key,
          imageUrl: args.imageUrl,
          dishName: args.dishName,
          description: args.description,
          price: args.price,
          reviewCount: args.reviewCount,
          reviewStar: args.reviewStar,
          listTopping: args.listTopping,
        ),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FavoriteScreen(),
      );
    },
    ForgotPassRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgotPassScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MainScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.NotificationScreen(),
      );
    },
    RestaurantDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantDetailRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.RestaurantDetailScreen(
          args.restaurantModel,
          key: args.key,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashScreen(),
      );
    },
    SwitchSiginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SwitchSiginScreen(),
      );
    },
    VerifyRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.VerifyScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CartScreen]
class CartRoute extends _i16.PageRouteInfo<void> {
  const CartRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DeliveryScreen]
class DeliveryRoute extends _i16.PageRouteInfo<void> {
  const DeliveryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DeliveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DishDetailScreen]
class DishDetailRoute extends _i16.PageRouteInfo<DishDetailRouteArgs> {
  DishDetailRoute({
    _i17.Key? key,
    required String? imageUrl,
    required String? dishName,
    required String? description,
    required double? price,
    required int? reviewCount,
    required double? reviewStar,
    List<_i18.ToppingModel>? listTopping,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          DishDetailRoute.name,
          args: DishDetailRouteArgs(
            key: key,
            imageUrl: imageUrl,
            dishName: dishName,
            description: description,
            price: price,
            reviewCount: reviewCount,
            reviewStar: reviewStar,
            listTopping: listTopping,
          ),
          initialChildren: children,
        );

  static const String name = 'DishDetailRoute';

  static const _i16.PageInfo<DishDetailRouteArgs> page =
      _i16.PageInfo<DishDetailRouteArgs>(name);
}

class DishDetailRouteArgs {
  const DishDetailRouteArgs({
    this.key,
    required this.imageUrl,
    required this.dishName,
    required this.description,
    required this.price,
    required this.reviewCount,
    required this.reviewStar,
    this.listTopping,
  });

  final _i17.Key? key;

  final String? imageUrl;

  final String? dishName;

  final String? description;

  final double? price;

  final int? reviewCount;

  final double? reviewStar;

  final List<_i18.ToppingModel>? listTopping;

  @override
  String toString() {
    return 'DishDetailRouteArgs{key: $key, imageUrl: $imageUrl, dishName: $dishName, description: $description, price: $price, reviewCount: $reviewCount, reviewStar: $reviewStar, listTopping: $listTopping}';
  }
}

/// generated route for
/// [_i4.FavoriteScreen]
class FavoriteRoute extends _i16.PageRouteInfo<void> {
  const FavoriteRoute({List<_i16.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ForgotPassScreen]
class ForgotPassRoute extends _i16.PageRouteInfo<void> {
  const ForgotPassRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ForgotPassRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPassRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MainScreen]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.NotificationScreen]
class NotificationRoute extends _i16.PageRouteInfo<void> {
  const NotificationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RestaurantDetailScreen]
class RestaurantDetailRoute
    extends _i16.PageRouteInfo<RestaurantDetailRouteArgs> {
  RestaurantDetailRoute({
    required _i19.RestaurantModel restaurantModel,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          RestaurantDetailRoute.name,
          args: RestaurantDetailRouteArgs(
            restaurantModel: restaurantModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RestaurantDetailRoute';

  static const _i16.PageInfo<RestaurantDetailRouteArgs> page =
      _i16.PageInfo<RestaurantDetailRouteArgs>(name);
}

class RestaurantDetailRouteArgs {
  const RestaurantDetailRouteArgs({
    required this.restaurantModel,
    this.key,
  });

  final _i19.RestaurantModel restaurantModel;

  final _i17.Key? key;

  @override
  String toString() {
    return 'RestaurantDetailRouteArgs{restaurantModel: $restaurantModel, key: $key}';
  }
}

/// generated route for
/// [_i11.SignUpScreen]
class SignUpRoute extends _i16.PageRouteInfo<void> {
  const SignUpRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SwitchSiginScreen]
class SwitchSiginRoute extends _i16.PageRouteInfo<void> {
  const SwitchSiginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SwitchSiginRoute.name,
          initialChildren: children,
        );

  static const String name = 'SwitchSiginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.VerifyScreen]
class VerifyRoute extends _i16.PageRouteInfo<void> {
  const VerifyRoute({List<_i16.PageRouteInfo>? children})
      : super(
          VerifyRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.WelcomeScreen]
class WelcomeRoute extends _i16.PageRouteInfo<void> {
  const WelcomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

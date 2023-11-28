import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: WelcomeRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page, children: [
              AutoRoute(page: RestaurantDetailRoute.page),
              AutoRoute(page: DishDetailRoute.page),
            ]),
            AutoRoute(path: "delivery", page: DeliveryRoute.page),
            AutoRoute(path: "cart", page: CartRoute.page),
            AutoRoute(path: "favorite", page: FavoriteRoute.page),
            AutoRoute(path: "notification", page: NotificationRoute.page),
            AutoRoute(page: MainRoute.page),
          ],
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: VerifyRoute.page),
        AutoRoute(page: ForgotPassRoute.page),
        // AutoRoute(page: RestaurantDetailRoute.page),
        // AutoRoute(page: DishDetailRoute.page),
        AutoRoute(page: SwitchSiginRoute.page),
      ];
}

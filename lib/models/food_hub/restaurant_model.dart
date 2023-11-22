import 'package:food_hub/models/food_hub/dish_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant_model.g.dart';
part 'restaurant_model.freezed.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "restaurant_name") required String restaurantName,
    @JsonKey(name: "review_count") required int reviewCount,
    @JsonKey(name: "review_star") required double reviewStar,
    @JsonKey(name: "deliveryDescription") required Map<String,dynamic> deliveryDescription,
    @JsonKey(name: "verify") required bool verify,
    @JsonKey(name: "background_image_url") required String backgroundImageUrl,
    @JsonKey(name: "restaurant_image_url") required String restaurantImageUrl,
    @JsonKey(name: "tags") required String tags,
    @JsonKey(name: "dishs") required List<DishModel> dishs,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}

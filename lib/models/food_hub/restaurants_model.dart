import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurants_model.g.dart';
part 'restaurants_model.freezed.dart';

@freezed
class RestaurantsModel with _$RestaurantsModel {
  const factory RestaurantsModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "restaurant_name") required String restaurantName,
    @JsonKey(name: "review_count") required int reviewCount,
    @JsonKey(name: "review_star") required double reviewStar,
    @JsonKey(name: "deliveryDescription") required Map<String,dynamic> deliveryDescription,
    @JsonKey(name: "verify") required bool verify,
    @JsonKey(name: "background_image_url") required String backgroundImageUrl,
    @JsonKey(name: "restaurant_image_url") required String restaurantImageUrl,
    @JsonKey(name: "tags") required String tags,
  }) = _RestaurantsModel;

  factory RestaurantsModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsModelFromJson(json);
}

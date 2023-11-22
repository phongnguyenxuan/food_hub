import 'package:food_hub/models/food_hub/topping_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dish_model.g.dart';
part 'dish_model.freezed.dart';

@freezed
class DishModel with _$DishModel {
  const factory DishModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "parent_id")  String? parentId,
    @JsonKey(name: "dish_name") required String dishName,
    @JsonKey(name: "image_url") required String imageUrl,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "price") required double price,
    @JsonKey(name: "review_count") required int reviewCount,
    @JsonKey(name: "review_star") required double reviewStar,
    @JsonKey(name: "toppings") List<ToppingModel>? toppings,
  }) = _DishModel;

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
}

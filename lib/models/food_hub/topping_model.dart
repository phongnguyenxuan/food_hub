import 'package:freezed_annotation/freezed_annotation.dart';
part 'topping_model.g.dart';
part 'topping_model.freezed.dart';

@freezed
class ToppingModel with _$ToppingModel {
  const factory ToppingModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "topping_name") required String toppingName,
    @JsonKey(name: "price") required double price,
    @JsonKey(name: "image_url") required String imageUrl,
  }) = _ToppingModel;

  factory ToppingModel.fromJson(Map<String, dynamic> json) =>
      _$ToppingModelFromJson(json);
}

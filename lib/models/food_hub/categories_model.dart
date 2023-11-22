import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_model.g.dart';
part 'categories_model.freezed.dart';

@freezed
class CategoriesModel with _$CategoriesModel {
  const factory CategoriesModel(
      {@JsonKey(name: "_id") required String id,
      @JsonKey(name: "category_name") required String categoryName,
      @JsonKey(name: "image_url") required String imageUrl}) = _CategoriesModel;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}

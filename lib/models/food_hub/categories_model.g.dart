// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoriesModelImpl _$$CategoriesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoriesModelImpl(
      id: json['_id'] as String,
      categoryName: json['category_name'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$CategoriesModelImplToJson(
        _$CategoriesModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'category_name': instance.categoryName,
      'image_url': instance.imageUrl,
    };

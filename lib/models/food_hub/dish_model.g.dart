// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DishModelImpl _$$DishModelImplFromJson(Map<String, dynamic> json) =>
    _$DishModelImpl(
      id: json['_id'] as String,
      parentId: json['parent_id'] as String?,
      dishName: json['dish_name'] as String,
      imageUrl: json['image_url'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      reviewCount: json['review_count'] as int,
      reviewStar: (json['review_star'] as num).toDouble(),
      toppings: (json['toppings'] as List<dynamic>?)
          ?.map((e) => ToppingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DishModelImplToJson(_$DishModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'parent_id': instance.parentId,
      'dish_name': instance.dishName,
      'image_url': instance.imageUrl,
      'description': instance.description,
      'price': instance.price,
      'review_count': instance.reviewCount,
      'review_star': instance.reviewStar,
      'toppings': instance.toppings,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantModelImpl _$$RestaurantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantModelImpl(
      id: json['_id'] as String,
      restaurantName: json['restaurant_name'] as String,
      reviewCount: json['review_count'] as int,
      reviewStar: (json['review_star'] as num).toDouble(),
      deliveryDescription: json['deliveryDescription'] as Map<String, dynamic>,
      verify: json['verify'] as bool,
      backgroundImageUrl: json['background_image_url'] as String,
      restaurantImageUrl: json['restaurant_image_url'] as String,
      tags: json['tags'] as String,
      dishs: (json['dishs'] as List<dynamic>)
          .map((e) => DishModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RestaurantModelImplToJson(
        _$RestaurantModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'restaurant_name': instance.restaurantName,
      'review_count': instance.reviewCount,
      'review_star': instance.reviewStar,
      'deliveryDescription': instance.deliveryDescription,
      'verify': instance.verify,
      'background_image_url': instance.backgroundImageUrl,
      'restaurant_image_url': instance.restaurantImageUrl,
      'tags': instance.tags,
      'dishs': instance.dishs,
    };

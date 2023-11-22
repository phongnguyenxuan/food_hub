// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToppingModelImpl _$$ToppingModelImplFromJson(Map<String, dynamic> json) =>
    _$ToppingModelImpl(
      id: json['_id'] as String,
      toppingName: json['topping_name'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$ToppingModelImplToJson(_$ToppingModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'topping_name': instance.toppingName,
      'price': instance.price,
      'image_url': instance.imageUrl,
    };

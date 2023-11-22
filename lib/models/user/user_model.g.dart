// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userName: json['user_name'] as String,
      email: json['email'] as String,
      isVerifiedEmail: json['is_verified_email'] as bool,
      id: json['_id'] as String,
      token: json['token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'email': instance.email,
      'is_verified_email': instance.isVerifiedEmail,
      '_id': instance.id,
      'token': instance.token,
      'refresh_token': instance.refreshToken,
    };

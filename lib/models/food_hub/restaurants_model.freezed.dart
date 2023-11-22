// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurants_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantsModel _$RestaurantsModelFromJson(Map<String, dynamic> json) {
  return _RestaurantsModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantsModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "restaurant_name")
  String get restaurantName => throw _privateConstructorUsedError;
  @JsonKey(name: "review_count")
  int get reviewCount => throw _privateConstructorUsedError;
  @JsonKey(name: "review_star")
  double get reviewStar => throw _privateConstructorUsedError;
  @JsonKey(name: "deliveryDescription")
  Map<String, dynamic> get deliveryDescription =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "verify")
  bool get verify => throw _privateConstructorUsedError;
  @JsonKey(name: "background_image_url")
  String get backgroundImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "restaurant_image_url")
  String get restaurantImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "tags")
  String get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantsModelCopyWith<RestaurantsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantsModelCopyWith<$Res> {
  factory $RestaurantsModelCopyWith(
          RestaurantsModel value, $Res Function(RestaurantsModel) then) =
      _$RestaurantsModelCopyWithImpl<$Res, RestaurantsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "restaurant_name") String restaurantName,
      @JsonKey(name: "review_count") int reviewCount,
      @JsonKey(name: "review_star") double reviewStar,
      @JsonKey(name: "deliveryDescription")
      Map<String, dynamic> deliveryDescription,
      @JsonKey(name: "verify") bool verify,
      @JsonKey(name: "background_image_url") String backgroundImageUrl,
      @JsonKey(name: "restaurant_image_url") String restaurantImageUrl,
      @JsonKey(name: "tags") String tags});
}

/// @nodoc
class _$RestaurantsModelCopyWithImpl<$Res, $Val extends RestaurantsModel>
    implements $RestaurantsModelCopyWith<$Res> {
  _$RestaurantsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantName = null,
    Object? reviewCount = null,
    Object? reviewStar = null,
    Object? deliveryDescription = null,
    Object? verify = null,
    Object? backgroundImageUrl = null,
    Object? restaurantImageUrl = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewStar: null == reviewStar
          ? _value.reviewStar
          : reviewStar // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryDescription: null == deliveryDescription
          ? _value.deliveryDescription
          : deliveryDescription // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verify: null == verify
          ? _value.verify
          : verify // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundImageUrl: null == backgroundImageUrl
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantImageUrl: null == restaurantImageUrl
          ? _value.restaurantImageUrl
          : restaurantImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantsModelImplCopyWith<$Res>
    implements $RestaurantsModelCopyWith<$Res> {
  factory _$$RestaurantsModelImplCopyWith(_$RestaurantsModelImpl value,
          $Res Function(_$RestaurantsModelImpl) then) =
      __$$RestaurantsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "restaurant_name") String restaurantName,
      @JsonKey(name: "review_count") int reviewCount,
      @JsonKey(name: "review_star") double reviewStar,
      @JsonKey(name: "deliveryDescription")
      Map<String, dynamic> deliveryDescription,
      @JsonKey(name: "verify") bool verify,
      @JsonKey(name: "background_image_url") String backgroundImageUrl,
      @JsonKey(name: "restaurant_image_url") String restaurantImageUrl,
      @JsonKey(name: "tags") String tags});
}

/// @nodoc
class __$$RestaurantsModelImplCopyWithImpl<$Res>
    extends _$RestaurantsModelCopyWithImpl<$Res, _$RestaurantsModelImpl>
    implements _$$RestaurantsModelImplCopyWith<$Res> {
  __$$RestaurantsModelImplCopyWithImpl(_$RestaurantsModelImpl _value,
      $Res Function(_$RestaurantsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantName = null,
    Object? reviewCount = null,
    Object? reviewStar = null,
    Object? deliveryDescription = null,
    Object? verify = null,
    Object? backgroundImageUrl = null,
    Object? restaurantImageUrl = null,
    Object? tags = null,
  }) {
    return _then(_$RestaurantsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewStar: null == reviewStar
          ? _value.reviewStar
          : reviewStar // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryDescription: null == deliveryDescription
          ? _value._deliveryDescription
          : deliveryDescription // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verify: null == verify
          ? _value.verify
          : verify // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundImageUrl: null == backgroundImageUrl
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantImageUrl: null == restaurantImageUrl
          ? _value.restaurantImageUrl
          : restaurantImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantsModelImpl implements _RestaurantsModel {
  const _$RestaurantsModelImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "restaurant_name") required this.restaurantName,
      @JsonKey(name: "review_count") required this.reviewCount,
      @JsonKey(name: "review_star") required this.reviewStar,
      @JsonKey(name: "deliveryDescription")
      required final Map<String, dynamic> deliveryDescription,
      @JsonKey(name: "verify") required this.verify,
      @JsonKey(name: "background_image_url") required this.backgroundImageUrl,
      @JsonKey(name: "restaurant_image_url") required this.restaurantImageUrl,
      @JsonKey(name: "tags") required this.tags})
      : _deliveryDescription = deliveryDescription;

  factory _$RestaurantsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantsModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "restaurant_name")
  final String restaurantName;
  @override
  @JsonKey(name: "review_count")
  final int reviewCount;
  @override
  @JsonKey(name: "review_star")
  final double reviewStar;
  final Map<String, dynamic> _deliveryDescription;
  @override
  @JsonKey(name: "deliveryDescription")
  Map<String, dynamic> get deliveryDescription {
    if (_deliveryDescription is EqualUnmodifiableMapView)
      return _deliveryDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_deliveryDescription);
  }

  @override
  @JsonKey(name: "verify")
  final bool verify;
  @override
  @JsonKey(name: "background_image_url")
  final String backgroundImageUrl;
  @override
  @JsonKey(name: "restaurant_image_url")
  final String restaurantImageUrl;
  @override
  @JsonKey(name: "tags")
  final String tags;

  @override
  String toString() {
    return 'RestaurantsModel(id: $id, restaurantName: $restaurantName, reviewCount: $reviewCount, reviewStar: $reviewStar, deliveryDescription: $deliveryDescription, verify: $verify, backgroundImageUrl: $backgroundImageUrl, restaurantImageUrl: $restaurantImageUrl, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.reviewStar, reviewStar) ||
                other.reviewStar == reviewStar) &&
            const DeepCollectionEquality()
                .equals(other._deliveryDescription, _deliveryDescription) &&
            (identical(other.verify, verify) || other.verify == verify) &&
            (identical(other.backgroundImageUrl, backgroundImageUrl) ||
                other.backgroundImageUrl == backgroundImageUrl) &&
            (identical(other.restaurantImageUrl, restaurantImageUrl) ||
                other.restaurantImageUrl == restaurantImageUrl) &&
            (identical(other.tags, tags) || other.tags == tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      restaurantName,
      reviewCount,
      reviewStar,
      const DeepCollectionEquality().hash(_deliveryDescription),
      verify,
      backgroundImageUrl,
      restaurantImageUrl,
      tags);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantsModelImplCopyWith<_$RestaurantsModelImpl> get copyWith =>
      __$$RestaurantsModelImplCopyWithImpl<_$RestaurantsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantsModelImplToJson(
      this,
    );
  }
}

abstract class _RestaurantsModel implements RestaurantsModel {
  const factory _RestaurantsModel(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "restaurant_name") required final String restaurantName,
      @JsonKey(name: "review_count") required final int reviewCount,
      @JsonKey(name: "review_star") required final double reviewStar,
      @JsonKey(name: "deliveryDescription")
      required final Map<String, dynamic> deliveryDescription,
      @JsonKey(name: "verify") required final bool verify,
      @JsonKey(name: "background_image_url")
      required final String backgroundImageUrl,
      @JsonKey(name: "restaurant_image_url")
      required final String restaurantImageUrl,
      @JsonKey(name: "tags")
      required final String tags}) = _$RestaurantsModelImpl;

  factory _RestaurantsModel.fromJson(Map<String, dynamic> json) =
      _$RestaurantsModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "restaurant_name")
  String get restaurantName;
  @override
  @JsonKey(name: "review_count")
  int get reviewCount;
  @override
  @JsonKey(name: "review_star")
  double get reviewStar;
  @override
  @JsonKey(name: "deliveryDescription")
  Map<String, dynamic> get deliveryDescription;
  @override
  @JsonKey(name: "verify")
  bool get verify;
  @override
  @JsonKey(name: "background_image_url")
  String get backgroundImageUrl;
  @override
  @JsonKey(name: "restaurant_image_url")
  String get restaurantImageUrl;
  @override
  @JsonKey(name: "tags")
  String get tags;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantsModelImplCopyWith<_$RestaurantsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

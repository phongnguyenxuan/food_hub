// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DishModel _$DishModelFromJson(Map<String, dynamic> json) {
  return _DishModel.fromJson(json);
}

/// @nodoc
mixin _$DishModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "parent_id")
  String? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "dish_name")
  String get dishName => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: "review_count")
  int get reviewCount => throw _privateConstructorUsedError;
  @JsonKey(name: "review_star")
  double get reviewStar => throw _privateConstructorUsedError;
  @JsonKey(name: "toppings")
  List<ToppingModel>? get toppings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishModelCopyWith<DishModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishModelCopyWith<$Res> {
  factory $DishModelCopyWith(DishModel value, $Res Function(DishModel) then) =
      _$DishModelCopyWithImpl<$Res, DishModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "parent_id") String? parentId,
      @JsonKey(name: "dish_name") String dishName,
      @JsonKey(name: "image_url") String imageUrl,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "price") double price,
      @JsonKey(name: "review_count") int reviewCount,
      @JsonKey(name: "review_star") double reviewStar,
      @JsonKey(name: "toppings") List<ToppingModel>? toppings});
}

/// @nodoc
class _$DishModelCopyWithImpl<$Res, $Val extends DishModel>
    implements $DishModelCopyWith<$Res> {
  _$DishModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? dishName = null,
    Object? imageUrl = null,
    Object? description = freezed,
    Object? price = null,
    Object? reviewCount = null,
    Object? reviewStar = null,
    Object? toppings = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      dishName: null == dishName
          ? _value.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewStar: null == reviewStar
          ? _value.reviewStar
          : reviewStar // ignore: cast_nullable_to_non_nullable
              as double,
      toppings: freezed == toppings
          ? _value.toppings
          : toppings // ignore: cast_nullable_to_non_nullable
              as List<ToppingModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishModelImplCopyWith<$Res>
    implements $DishModelCopyWith<$Res> {
  factory _$$DishModelImplCopyWith(
          _$DishModelImpl value, $Res Function(_$DishModelImpl) then) =
      __$$DishModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "parent_id") String? parentId,
      @JsonKey(name: "dish_name") String dishName,
      @JsonKey(name: "image_url") String imageUrl,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "price") double price,
      @JsonKey(name: "review_count") int reviewCount,
      @JsonKey(name: "review_star") double reviewStar,
      @JsonKey(name: "toppings") List<ToppingModel>? toppings});
}

/// @nodoc
class __$$DishModelImplCopyWithImpl<$Res>
    extends _$DishModelCopyWithImpl<$Res, _$DishModelImpl>
    implements _$$DishModelImplCopyWith<$Res> {
  __$$DishModelImplCopyWithImpl(
      _$DishModelImpl _value, $Res Function(_$DishModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? dishName = null,
    Object? imageUrl = null,
    Object? description = freezed,
    Object? price = null,
    Object? reviewCount = null,
    Object? reviewStar = null,
    Object? toppings = freezed,
  }) {
    return _then(_$DishModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      dishName: null == dishName
          ? _value.dishName
          : dishName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewStar: null == reviewStar
          ? _value.reviewStar
          : reviewStar // ignore: cast_nullable_to_non_nullable
              as double,
      toppings: freezed == toppings
          ? _value._toppings
          : toppings // ignore: cast_nullable_to_non_nullable
              as List<ToppingModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DishModelImpl implements _DishModel {
  const _$DishModelImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "parent_id") this.parentId,
      @JsonKey(name: "dish_name") required this.dishName,
      @JsonKey(name: "image_url") required this.imageUrl,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "review_count") required this.reviewCount,
      @JsonKey(name: "review_star") required this.reviewStar,
      @JsonKey(name: "toppings") final List<ToppingModel>? toppings})
      : _toppings = toppings;

  factory _$DishModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DishModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "parent_id")
  final String? parentId;
  @override
  @JsonKey(name: "dish_name")
  final String dishName;
  @override
  @JsonKey(name: "image_url")
  final String imageUrl;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "price")
  final double price;
  @override
  @JsonKey(name: "review_count")
  final int reviewCount;
  @override
  @JsonKey(name: "review_star")
  final double reviewStar;
  final List<ToppingModel>? _toppings;
  @override
  @JsonKey(name: "toppings")
  List<ToppingModel>? get toppings {
    final value = _toppings;
    if (value == null) return null;
    if (_toppings is EqualUnmodifiableListView) return _toppings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DishModel(id: $id, parentId: $parentId, dishName: $dishName, imageUrl: $imageUrl, description: $description, price: $price, reviewCount: $reviewCount, reviewStar: $reviewStar, toppings: $toppings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.dishName, dishName) ||
                other.dishName == dishName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.reviewStar, reviewStar) ||
                other.reviewStar == reviewStar) &&
            const DeepCollectionEquality().equals(other._toppings, _toppings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      parentId,
      dishName,
      imageUrl,
      description,
      price,
      reviewCount,
      reviewStar,
      const DeepCollectionEquality().hash(_toppings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DishModelImplCopyWith<_$DishModelImpl> get copyWith =>
      __$$DishModelImplCopyWithImpl<_$DishModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DishModelImplToJson(
      this,
    );
  }
}

abstract class _DishModel implements DishModel {
  const factory _DishModel(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "parent_id") final String? parentId,
          @JsonKey(name: "dish_name") required final String dishName,
          @JsonKey(name: "image_url") required final String imageUrl,
          @JsonKey(name: "description") final String? description,
          @JsonKey(name: "price") required final double price,
          @JsonKey(name: "review_count") required final int reviewCount,
          @JsonKey(name: "review_star") required final double reviewStar,
          @JsonKey(name: "toppings") final List<ToppingModel>? toppings}) =
      _$DishModelImpl;

  factory _DishModel.fromJson(Map<String, dynamic> json) =
      _$DishModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "parent_id")
  String? get parentId;
  @override
  @JsonKey(name: "dish_name")
  String get dishName;
  @override
  @JsonKey(name: "image_url")
  String get imageUrl;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "price")
  double get price;
  @override
  @JsonKey(name: "review_count")
  int get reviewCount;
  @override
  @JsonKey(name: "review_star")
  double get reviewStar;
  @override
  @JsonKey(name: "toppings")
  List<ToppingModel>? get toppings;
  @override
  @JsonKey(ignore: true)
  _$$DishModelImplCopyWith<_$DishModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

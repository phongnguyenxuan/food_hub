// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topping_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToppingModel _$ToppingModelFromJson(Map<String, dynamic> json) {
  return _ToppingModel.fromJson(json);
}

/// @nodoc
mixin _$ToppingModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "topping_name")
  String get toppingName => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToppingModelCopyWith<ToppingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToppingModelCopyWith<$Res> {
  factory $ToppingModelCopyWith(
          ToppingModel value, $Res Function(ToppingModel) then) =
      _$ToppingModelCopyWithImpl<$Res, ToppingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "topping_name") String toppingName,
      @JsonKey(name: "price") double price,
      @JsonKey(name: "image_url") String imageUrl});
}

/// @nodoc
class _$ToppingModelCopyWithImpl<$Res, $Val extends ToppingModel>
    implements $ToppingModelCopyWith<$Res> {
  _$ToppingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toppingName = null,
    Object? price = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      toppingName: null == toppingName
          ? _value.toppingName
          : toppingName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToppingModelImplCopyWith<$Res>
    implements $ToppingModelCopyWith<$Res> {
  factory _$$ToppingModelImplCopyWith(
          _$ToppingModelImpl value, $Res Function(_$ToppingModelImpl) then) =
      __$$ToppingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "topping_name") String toppingName,
      @JsonKey(name: "price") double price,
      @JsonKey(name: "image_url") String imageUrl});
}

/// @nodoc
class __$$ToppingModelImplCopyWithImpl<$Res>
    extends _$ToppingModelCopyWithImpl<$Res, _$ToppingModelImpl>
    implements _$$ToppingModelImplCopyWith<$Res> {
  __$$ToppingModelImplCopyWithImpl(
      _$ToppingModelImpl _value, $Res Function(_$ToppingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toppingName = null,
    Object? price = null,
    Object? imageUrl = null,
  }) {
    return _then(_$ToppingModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      toppingName: null == toppingName
          ? _value.toppingName
          : toppingName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToppingModelImpl implements _ToppingModel {
  const _$ToppingModelImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "topping_name") required this.toppingName,
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "image_url") required this.imageUrl});

  factory _$ToppingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToppingModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "topping_name")
  final String toppingName;
  @override
  @JsonKey(name: "price")
  final double price;
  @override
  @JsonKey(name: "image_url")
  final String imageUrl;

  @override
  String toString() {
    return 'ToppingModel(id: $id, toppingName: $toppingName, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToppingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.toppingName, toppingName) ||
                other.toppingName == toppingName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, toppingName, price, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToppingModelImplCopyWith<_$ToppingModelImpl> get copyWith =>
      __$$ToppingModelImplCopyWithImpl<_$ToppingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToppingModelImplToJson(
      this,
    );
  }
}

abstract class _ToppingModel implements ToppingModel {
  const factory _ToppingModel(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "topping_name") required final String toppingName,
          @JsonKey(name: "price") required final double price,
          @JsonKey(name: "image_url") required final String imageUrl}) =
      _$ToppingModelImpl;

  factory _ToppingModel.fromJson(Map<String, dynamic> json) =
      _$ToppingModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "topping_name")
  String get toppingName;
  @override
  @JsonKey(name: "price")
  double get price;
  @override
  @JsonKey(name: "image_url")
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$ToppingModelImplCopyWith<_$ToppingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

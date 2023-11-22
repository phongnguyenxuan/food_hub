// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RespoModel _$RespoModelFromJson(Map<String, dynamic> json) {
  return _RespoModel.fromJson(json);
}

/// @nodoc
mixin _$RespoModel {
  Map<String, dynamic>? get results => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RespoModelCopyWith<RespoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RespoModelCopyWith<$Res> {
  factory $RespoModelCopyWith(
          RespoModel value, $Res Function(RespoModel) then) =
      _$RespoModelCopyWithImpl<$Res, RespoModel>;
  @useResult
  $Res call({Map<String, dynamic>? results, String? msg});
}

/// @nodoc
class _$RespoModelCopyWithImpl<$Res, $Val extends RespoModel>
    implements $RespoModelCopyWith<$Res> {
  _$RespoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? msg = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RespoModelImplCopyWith<$Res>
    implements $RespoModelCopyWith<$Res> {
  factory _$$RespoModelImplCopyWith(
          _$RespoModelImpl value, $Res Function(_$RespoModelImpl) then) =
      __$$RespoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? results, String? msg});
}

/// @nodoc
class __$$RespoModelImplCopyWithImpl<$Res>
    extends _$RespoModelCopyWithImpl<$Res, _$RespoModelImpl>
    implements _$$RespoModelImplCopyWith<$Res> {
  __$$RespoModelImplCopyWithImpl(
      _$RespoModelImpl _value, $Res Function(_$RespoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? msg = freezed,
  }) {
    return _then(_$RespoModelImpl(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RespoModelImpl implements _RespoModel {
  const _$RespoModelImpl({final Map<String, dynamic>? results, this.msg})
      : _results = results;

  factory _$RespoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RespoModelImplFromJson(json);

  final Map<String, dynamic>? _results;
  @override
  Map<String, dynamic>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableMapView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? msg;

  @override
  String toString() {
    return 'RespoModel(results: $results, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RespoModelImpl &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RespoModelImplCopyWith<_$RespoModelImpl> get copyWith =>
      __$$RespoModelImplCopyWithImpl<_$RespoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RespoModelImplToJson(
      this,
    );
  }
}

abstract class _RespoModel implements RespoModel {
  const factory _RespoModel(
      {final Map<String, dynamic>? results,
      final String? msg}) = _$RespoModelImpl;

  factory _RespoModel.fromJson(Map<String, dynamic> json) =
      _$RespoModelImpl.fromJson;

  @override
  Map<String, dynamic>? get results;
  @override
  String? get msg;
  @override
  @JsonKey(ignore: true)
  _$$RespoModelImplCopyWith<_$RespoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

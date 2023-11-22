import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "user_name") required String userName,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "is_verified_email") required bool isVerifiedEmail,
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "token") required String token,
    @JsonKey(name: "refresh_token") required String refreshToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

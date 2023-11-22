import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_model.g.dart';
part 'response_model.freezed.dart';
@freezed
class RespoModel with _$RespoModel {
  const factory RespoModel({
    Map<String, dynamic>? results,
    String? msg,  
  }) = _RespoModel;

  factory RespoModel.fromJson(Map<String, dynamic>json) => _$RespoModelFromJson(json);
}
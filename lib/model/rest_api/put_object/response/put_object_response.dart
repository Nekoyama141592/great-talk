import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_object_response.freezed.dart';
part 'put_object_response.g.dart';

@freezed
abstract class PutObjectResponse implements _$PutObjectResponse {
  const PutObjectResponse._();
  const factory PutObjectResponse({required String base64Image}) =
      _PutObjectResponse;
  factory PutObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$PutObjectResponseFromJson(json);
}

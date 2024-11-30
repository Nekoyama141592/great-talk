import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_object_response.freezed.dart';
part 'delete_object_response.g.dart';

@freezed
abstract class DeleteObjectResponse implements _$DeleteObjectResponse {
  const DeleteObjectResponse._();
  const factory DeleteObjectResponse({required String base64Image}) =
      _DeleteObjectResponse;
  factory DeleteObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteObjectResponseFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_object_response.freezed.dart';
part 'get_object_response.g.dart';

@freezed
abstract class GetObjectResponse with _$GetObjectResponse {
  const GetObjectResponse._();
  const factory GetObjectResponse({required String base64Image}) =
      _GetObjectResponse;
  factory GetObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$GetObjectResponseFromJson(json);
}

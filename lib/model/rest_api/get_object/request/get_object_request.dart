import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_object_request.freezed.dart';
part 'get_object_request.g.dart';

@freezed
abstract class GetObjectRequest with _$GetObjectRequest {
  const GetObjectRequest._();
  const factory GetObjectRequest({required String object}) = _GetObjectRequest;
  factory GetObjectRequest.fromJson(Map<String, dynamic> json) =>
      _$GetObjectRequestFromJson(json);
}

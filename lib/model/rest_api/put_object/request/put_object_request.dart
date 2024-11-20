import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_object_request.freezed.dart';
part 'put_object_request.g.dart';

@freezed
abstract class PutObjectRequest implements _$PutObjectRequest {
  const PutObjectRequest._();
  const factory PutObjectRequest(
      {required String image}) = _PutObjectRequest;
  factory PutObjectRequest.fromJson(Map<String, dynamic> json) =>
      _$PutObjectRequestFromJson(json);
}

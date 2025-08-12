import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post_request.freezed.dart';
part 'create_post_request.g.dart';

@freezed
abstract class CreatePostRequest with _$CreatePostRequest {
  const CreatePostRequest._();
  const factory CreatePostRequest({
    required String title,
    required String description,
    required String base64Image,
    required String systemPrompt,
  }) = _CreatePostRequest;
  factory CreatePostRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestFromJson(json);
}

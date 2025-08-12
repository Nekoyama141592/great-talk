import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post_response.freezed.dart';
part 'create_post_response.g.dart';

@freezed
abstract class CreatePostResponse with _$CreatePostResponse {
  const CreatePostResponse._();
  const factory CreatePostResponse({
    required String postId,
    required Map<String, dynamic> moderatedImage,
    required Map<String, dynamic> detectedTitle,
    required Map<String, dynamic> detectedDescription,
  }) = _CreatePostResponse;
  factory CreatePostResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePostResponseFromJson(json);
}
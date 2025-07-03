import 'package:great_talk/infrastructure/model/rest_api/delete_object/response/delete_object_response.dart';
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_image/response/generate_image_response.dart';
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_text/response/generate_text_response.dart';
import 'package:great_talk/infrastructure/model/rest_api/put_object/response/put_object_response.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/infrastructure/model/result/result.dart' as rs;

/// Abstract interface for API operations including image handling,
/// AI text/image generation, and purchase verification.
abstract class IApiRepository {
  /// Uploads an object to cloud storage
  rs.FutureResult<PutObjectResponse> putObject(
    String base64Image,
    String object,
  );

  /// Retrieves an object from cloud storage
  rs.FutureResult<String> getObject(String object);

  /// Deletes an image object from cloud storage
  rs.FutureResult<DeleteObjectResponse> deleteObject(String object);

  /// Generates an image using AI based on prompt and size
  rs.FutureResult<GenerateImageResponse?> generateImage(
    String prompt,
    String size,
  );

  /// Generates text using AI based on the provided request
  rs.FutureResult<GenerateTextResponse> generateText(
    String model,
    List<Map<String, dynamic>> messages,
  );

  /// Verifies Android purchase receipt
  rs.FutureResult<VerifiedPurchase> verifyAndroidReceipt(
    Map<String, dynamic> purchaseDetailsJson,
  );

  /// Verifies iOS purchase receipt
  rs.FutureResult<VerifiedPurchase> verifyIOSReceipt(
    Map<String, dynamic> purchaseDetailsJson,
  );
}

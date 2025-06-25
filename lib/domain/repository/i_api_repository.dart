import 'package:great_talk/domain/entity/detected_image/detected_image.dart';
import 'package:great_talk/model/rest_api/delete_object/response/delete_object_response.dart';
import 'package:great_talk/model/rest_api/get_object/request/get_object_request.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_image/response/generate_image_response.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/request/generate_text_request.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/response/generate_text_response.dart';
import 'package:great_talk/model/rest_api/put_object/request/put_object_request.dart';
import 'package:great_talk/model/rest_api/put_object/response/put_object_response.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/repository/result/result.dart' as rs;
import 'package:in_app_purchase/in_app_purchase.dart';

/// Abstract interface for API operations including image handling,
/// AI text/image generation, and purchase verification.
abstract class IApiRepository {
  /// Uploads an object to cloud storage
  rs.FutureResult<PutObjectResponse> putObject(PutObjectRequest request);

  /// Retrieves an object from cloud storage
  rs.FutureResult<String> getObject(GetObjectRequest request);

  /// Deletes an image object from cloud storage
  rs.FutureResult<DeleteObjectResponse> deleteObject(DetectedImage image);

  /// Generates an image using AI based on prompt and size
  rs.FutureResult<GenerateImageResponse?> generateImage(
    String prompt,
    String size,
  );

  /// Generates text using AI based on the provided request
  rs.FutureResult<GenerateTextResponse> generateText(
    GenerateTextRequest request,
  );

  /// Verifies Android purchase receipt
  rs.FutureResult<VerifiedPurchase> verifyAndroidReceipt(
    PurchaseDetails purchaseDetails,
  );

  /// Verifies iOS purchase receipt
  rs.FutureResult<VerifiedPurchase> verifyIOSReceipt(
    PurchaseDetails purchaseDetails,
  );
}
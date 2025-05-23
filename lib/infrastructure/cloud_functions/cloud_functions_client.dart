import 'package:dio/dio.dart';
import 'package:great_talk/infrastructure/open_ai/original_dio.dart';
import 'package:great_talk/model/rest_api/receipt_request/receipt_request.dart';
import 'package:great_talk/model/rest_api/receipt_response/receipt_response.dart';
import 'package:retrofit/retrofit.dart';
part 'cloud_functions_client_part.dart';

@RestApi()
abstract class CloudFunctionsClient {
  factory CloudFunctionsClient(OriginalDio dio) = _CloudFunctionsClient;
  @POST("/verifyIOSReceipt")
  Future<ReceiptResponse> getIOSReceipt(@Body() ReceiptRequest request);
  @POST("/verifyAndroidReceipt")
  Future<ReceiptResponse> getAndroidReceipt(@Body() ReceiptRequest request);
}

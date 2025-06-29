// Mocks generated by Mockito 5.4.6 from annotations
// in great_talk/test/application/use_case/purchase/purchase_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:cloud_functions/cloud_functions.dart' as _i2;
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart'
    as _i11;
import 'package:great_talk/infrastructure/model/rest_api/delete_object/response/delete_object_response.dart'
    as _i10;
import 'package:great_talk/infrastructure/model/rest_api/get_object/request/get_object_request.dart'
    as _i9;
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_image/response/generate_image_response.dart'
    as _i12;
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_text/request/generate_text_request.dart'
    as _i14;
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_text/response/generate_text_response.dart'
    as _i13;
import 'package:great_talk/infrastructure/model/rest_api/put_object/request/put_object_request.dart'
    as _i8;
import 'package:great_talk/infrastructure/model/rest_api/put_object/response/put_object_response.dart'
    as _i7;
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart'
    as _i15;
import 'package:great_talk/infrastructure/repository/api_repository.dart'
    as _i5;
import 'package:great_talk/infrastructure/repository/result/result.dart' as _i3;
import 'package:in_app_purchase/in_app_purchase.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i16;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFirebaseFunctions_0 extends _i1.SmartFake
    implements _i2.FirebaseFunctions {
  _FakeFirebaseFunctions_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeResult_1<T> extends _i1.SmartFake implements _i3.Result<T> {
  _FakeResult_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakePurchaseVerificationData_2 extends _i1.SmartFake
    implements _i4.PurchaseVerificationData {
  _FakePurchaseVerificationData_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ApiRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiRepository extends _i1.Mock implements _i5.ApiRepository {
  MockApiRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseFunctions get client =>
      (super.noSuchMethod(
            Invocation.getter(#client),
            returnValue: _FakeFirebaseFunctions_0(
              this,
              Invocation.getter(#client),
            ),
          )
          as _i2.FirebaseFunctions);

  @override
  _i6.Future<_i3.Result<_i7.PutObjectResponse>> putObject(
    _i8.PutObjectRequest? request,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#putObject, [request]),
            returnValue: _i6.Future<_i3.Result<_i7.PutObjectResponse>>.value(
              _FakeResult_1<_i7.PutObjectResponse>(
                this,
                Invocation.method(#putObject, [request]),
              ),
            ),
          )
          as _i6.Future<_i3.Result<_i7.PutObjectResponse>>);

  @override
  _i6.Future<_i3.Result<String>> getObject(_i9.GetObjectRequest? request) =>
      (super.noSuchMethod(
            Invocation.method(#getObject, [request]),
            returnValue: _i6.Future<_i3.Result<String>>.value(
              _FakeResult_1<String>(
                this,
                Invocation.method(#getObject, [request]),
              ),
            ),
          )
          as _i6.Future<_i3.Result<String>>);

  @override
  _i6.Future<_i3.Result<_i10.DeleteObjectResponse>> deleteObject(
    _i11.DetectedImage? image,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#deleteObject, [image]),
            returnValue:
                _i6.Future<_i3.Result<_i10.DeleteObjectResponse>>.value(
                  _FakeResult_1<_i10.DeleteObjectResponse>(
                    this,
                    Invocation.method(#deleteObject, [image]),
                  ),
                ),
          )
          as _i6.Future<_i3.Result<_i10.DeleteObjectResponse>>);

  @override
  _i6.Future<_i3.Result<_i12.GenerateImageResponse?>> generateImage(
    String? prompt,
    String? size,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#generateImage, [prompt, size]),
            returnValue:
                _i6.Future<_i3.Result<_i12.GenerateImageResponse?>>.value(
                  _FakeResult_1<_i12.GenerateImageResponse?>(
                    this,
                    Invocation.method(#generateImage, [prompt, size]),
                  ),
                ),
          )
          as _i6.Future<_i3.Result<_i12.GenerateImageResponse?>>);

  @override
  _i6.Future<_i3.Result<_i13.GenerateTextResponse>> generateText(
    _i14.GenerateTextRequest? request,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#generateText, [request]),
            returnValue:
                _i6.Future<_i3.Result<_i13.GenerateTextResponse>>.value(
                  _FakeResult_1<_i13.GenerateTextResponse>(
                    this,
                    Invocation.method(#generateText, [request]),
                  ),
                ),
          )
          as _i6.Future<_i3.Result<_i13.GenerateTextResponse>>);

  @override
  _i6.Future<_i3.Result<_i15.VerifiedPurchase>> verifyAndroidReceipt(
    _i4.PurchaseDetails? purchaseDetails,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#verifyAndroidReceipt, [purchaseDetails]),
            returnValue: _i6.Future<_i3.Result<_i15.VerifiedPurchase>>.value(
              _FakeResult_1<_i15.VerifiedPurchase>(
                this,
                Invocation.method(#verifyAndroidReceipt, [purchaseDetails]),
              ),
            ),
          )
          as _i6.Future<_i3.Result<_i15.VerifiedPurchase>>);

  @override
  _i6.Future<_i3.Result<_i15.VerifiedPurchase>> verifyIOSReceipt(
    _i4.PurchaseDetails? purchaseDetails,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#verifyIOSReceipt, [purchaseDetails]),
            returnValue: _i6.Future<_i3.Result<_i15.VerifiedPurchase>>.value(
              _FakeResult_1<_i15.VerifiedPurchase>(
                this,
                Invocation.method(#verifyIOSReceipt, [purchaseDetails]),
              ),
            ),
          )
          as _i6.Future<_i3.Result<_i15.VerifiedPurchase>>);
}

/// A class which mocks [PurchaseDetails].
///
/// See the documentation for Mockito's code generation for more information.
class MockPurchaseDetails extends _i1.Mock implements _i4.PurchaseDetails {
  MockPurchaseDetails() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get productID =>
      (super.noSuchMethod(
            Invocation.getter(#productID),
            returnValue: _i16.dummyValue<String>(
              this,
              Invocation.getter(#productID),
            ),
          )
          as String);

  @override
  _i4.PurchaseVerificationData get verificationData =>
      (super.noSuchMethod(
            Invocation.getter(#verificationData),
            returnValue: _FakePurchaseVerificationData_2(
              this,
              Invocation.getter(#verificationData),
            ),
          )
          as _i4.PurchaseVerificationData);

  @override
  _i4.PurchaseStatus get status =>
      (super.noSuchMethod(
            Invocation.getter(#status),
            returnValue: _i4.PurchaseStatus.pending,
          )
          as _i4.PurchaseStatus);

  @override
  set status(_i4.PurchaseStatus? _status) => super.noSuchMethod(
    Invocation.setter(#status, _status),
    returnValueForMissingStub: null,
  );

  @override
  set error(_i4.IAPError? _error) => super.noSuchMethod(
    Invocation.setter(#error, _error),
    returnValueForMissingStub: null,
  );

  @override
  bool get pendingCompletePurchase =>
      (super.noSuchMethod(
            Invocation.getter(#pendingCompletePurchase),
            returnValue: false,
          )
          as bool);

  @override
  set pendingCompletePurchase(bool? _pendingCompletePurchase) =>
      super.noSuchMethod(
        Invocation.setter(#pendingCompletePurchase, _pendingCompletePurchase),
        returnValueForMissingStub: null,
      );
}

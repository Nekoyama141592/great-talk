import 'package:cloud_functions/cloud_functions.dart';
import 'package:great_talk/core/firestore/json_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'on_call_client.g.dart';

@riverpod
OnCallClient onCallClient(Ref ref) => OnCallClient();

class OnCallClient {
  HttpsCallable _httpsCallable(String functionName) =>
      FirebaseFunctions.instance.httpsCallable(
        functionName,
        options: HttpsCallableOptions(timeout: const Duration(seconds: 300)),
      );
  Future<Map<String, dynamic>> call(
    String name,
    Map<String, dynamic> request,
  ) async {
    final callable = _httpsCallable(name);
    final result = await callable.call(request);
    final data = result.data;
    final decoded = JsonCore.encodeDecode(data);
    return decoded;
  }
}

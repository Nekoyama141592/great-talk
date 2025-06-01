import 'package:great_talk/infrastructure/cloud_functions/cloud_functions_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cloud_functions_client_provider.g.dart';

@riverpod
CloudFunctionsClient cloudFunctionsClient(Ref ref) => CloudFunctionsClient();

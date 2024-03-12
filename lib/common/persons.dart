import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/consts/env_keys.dart';

const String calculateAI = "calculate_ai";
final officialUid = dotenv.get(EnvKeys.OFFICIAL_ACCOUNT_UID.name);

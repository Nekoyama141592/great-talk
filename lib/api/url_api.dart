import 'package:url_launcher/url_launcher.dart';

class UrlApi {
  static const String _privacy = "https://impartial-literature-dfb.notion.site/2b71dbec76c64d80b16baefc8fc8485b";
  static final privacyPolicyUri = Uri.parse(_privacy);
  static Future<void> toPrivacyPage() async => await launchUrl(privacyPolicyUri,mode: LaunchMode.externalApplication);

  static const String eula = "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/";
  static final eulaUri = Uri.parse(eula);
  static Future<void> toEULAPage() async => await launchUrl(eulaUri,mode: LaunchMode.externalApplication);
}
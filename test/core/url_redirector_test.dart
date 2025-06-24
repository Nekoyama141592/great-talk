import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/url_redirector.dart';

void main() {
  group('UrlRedirector', () {
    group('URI constants', () {
      test('should have correct privacy policy URI', () {
        expect(
          UrlRedirector.privacyPolicyUri.toString(),
          'https://impartial-literature-dfb.notion.site/2b71dbec76c64d80b16baefc8fc8485b',
        );
      });

      test('should have correct EULA URI', () {
        expect(
          UrlRedirector.eulaUri.toString(),
          'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
        );
      });

      test('should have correct Terms of Service URI', () {
        expect(
          UrlRedirector.tosUri.toString(),
          'https://impartial-literature-dfb.notion.site/AI-bccd27c2976242958409537ac1cbc31b?pvs=4',
        );
      });
    });

    group('URI validation', () {
      test('privacy policy URI should be valid', () {
        expect(UrlRedirector.privacyPolicyUri.isAbsolute, isTrue);
        expect(UrlRedirector.privacyPolicyUri.scheme, 'https');
        expect(
          UrlRedirector.privacyPolicyUri.host,
          'impartial-literature-dfb.notion.site',
        );
      });

      test('EULA URI should be valid', () {
        expect(UrlRedirector.eulaUri.isAbsolute, isTrue);
        expect(UrlRedirector.eulaUri.scheme, 'https');
        expect(UrlRedirector.eulaUri.host, 'www.apple.com');
      });

      test('Terms of Service URI should be valid', () {
        expect(UrlRedirector.tosUri.isAbsolute, isTrue);
        expect(UrlRedirector.tosUri.scheme, 'https');
        expect(
          UrlRedirector.tosUri.host,
          'impartial-literature-dfb.notion.site',
        );
      });
    });

    group('static methods', () {
      test('toPrivacyPage should be callable', () {
        expect(() => UrlRedirector.toPrivacyPage, returnsNormally);
      });

      test('toEULAPage should be callable', () {
        expect(() => UrlRedirector.toEULAPage, returnsNormally);
      });

      test('toTosPage should be callable', () {
        expect(() => UrlRedirector.toTosPage, returnsNormally);
      });
    });

    group('URL parsing', () {
      test('privacy policy URL should parse correctly', () {
        const privacyUrl =
            "https://impartial-literature-dfb.notion.site/2b71dbec76c64d80b16baefc8fc8485b";
        final parsedUri = Uri.parse(privacyUrl);

        expect(
          parsedUri.toString(),
          equals(UrlRedirector.privacyPolicyUri.toString()),
        );
        expect(parsedUri.scheme, equals('https'));
        expect(parsedUri.host, equals('impartial-literature-dfb.notion.site'));
      });

      test('EULA URL should parse correctly', () {
        const eulaUrl =
            "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/";
        final parsedUri = Uri.parse(eulaUrl);

        expect(parsedUri.toString(), equals(UrlRedirector.eulaUri.toString()));
        expect(parsedUri.scheme, equals('https'));
        expect(parsedUri.host, equals('www.apple.com'));
        expect(
          parsedUri.path,
          equals('/legal/internet-services/itunes/dev/stdeula/'),
        );
      });

      test('ToS URL should parse correctly', () {
        const tosUrl =
            "https://impartial-literature-dfb.notion.site/AI-bccd27c2976242958409537ac1cbc31b?pvs=4";
        final parsedUri = Uri.parse(tosUrl);

        expect(parsedUri.toString(), equals(UrlRedirector.tosUri.toString()));
        expect(parsedUri.scheme, equals('https'));
        expect(parsedUri.host, equals('impartial-literature-dfb.notion.site'));
        expect(parsedUri.queryParameters['pvs'], equals('4'));
      });
    });

    group('URI properties', () {
      test('all URIs should use HTTPS', () {
        expect(UrlRedirector.privacyPolicyUri.scheme, equals('https'));
        expect(UrlRedirector.eulaUri.scheme, equals('https'));
        expect(UrlRedirector.tosUri.scheme, equals('https'));
      });

      test('all URIs should be absolute', () {
        expect(UrlRedirector.privacyPolicyUri.isAbsolute, isTrue);
        expect(UrlRedirector.eulaUri.isAbsolute, isTrue);
        expect(UrlRedirector.tosUri.isAbsolute, isTrue);
      });

      test('all URIs should have valid hosts', () {
        expect(UrlRedirector.privacyPolicyUri.host, isNotEmpty);
        expect(UrlRedirector.eulaUri.host, isNotEmpty);
        expect(UrlRedirector.tosUri.host, isNotEmpty);
      });
    });

    group('static constants access', () {
      test('should be able to access privacy policy URI', () {
        final uri = UrlRedirector.privacyPolicyUri;
        expect(uri, isA<Uri>());
        expect(uri.toString(), contains('notion.site'));
      });

      test('should be able to access EULA URI', () {
        final uri = UrlRedirector.eulaUri;
        expect(uri, isA<Uri>());
        expect(uri.toString(), contains('apple.com'));
      });

      test('should be able to access ToS URI', () {
        final uri = UrlRedirector.tosUri;
        expect(uri, isA<Uri>());
        expect(uri.toString(), contains('notion.site'));
      });
    });

    group('error handling', () {
      test('URIs should not be null', () {
        expect(UrlRedirector.privacyPolicyUri, isNotNull);
        expect(UrlRedirector.eulaUri, isNotNull);
        expect(UrlRedirector.tosUri, isNotNull);
      });

      test('URI strings should not be empty', () {
        expect(UrlRedirector.privacyPolicyUri.toString(), isNotEmpty);
        expect(UrlRedirector.eulaUri.toString(), isNotEmpty);
        expect(UrlRedirector.tosUri.toString(), isNotEmpty);
      });
    });
  });
}

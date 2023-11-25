import 'package:stringmanipulation_urlqueryparametersparser/stringmanipulation_urlqueryparametersparser.dart';
import 'package:test/test.dart';

void main() {
  group('URL Query Parameters Parser Tests', () {
    test('URL with multiple parameters', () {
      var result = parseQueryParams(
          'https://example.com/page?param1=value1&param2=value2');
      expect(result, equals({'param1': 'value1', 'param2': 'value2'}));
    });

    test('URL with single parameter', () {
      var result = parseQueryParams('https://example.com/page?param=value');
      expect(result, equals({'param': 'value'}));
    });

    test('URL without parameters', () {
      var result = parseQueryParams('https://example.com/page');
      expect(result, isEmpty);
    });

    test('Invalid URL format', () {
      var result = parseQueryParams('example.com/page?param=value');
      expect(result, isNull); // or handle as per your function's design
    });

    // Add more tests for different URL formats and edge cases.
  });
}

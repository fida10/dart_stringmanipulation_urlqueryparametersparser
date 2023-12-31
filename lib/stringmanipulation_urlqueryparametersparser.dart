library;

export 'src/stringmanipulation_urlqueryparametersparser_base.dart';

/*
Challenge: Given a URL string such as "https://example.com/page?param1=value1&param2=value2", 
write a Dart function to parse the query parameters and their values into a Map. 
For instance, the output for the example should be {param1: value1, param2: value2}. 
Implement this first using string methods like split, then try using regular expressions.

Key Points: This problem tests your ability to extract specific parts of a string and 
transform them into a structured format (Map). It combines knowledge of string
manipulation methods and pattern matching with regular expressions.
 */

Map<String, String>? parseQueryParams(String url) {
  // Map<String, String>? result = {};

  // if (!url.startsWith("https://")) {
  //   return null;
  // }
  // try {
  //   for (var indivEntry in url.split('?')[1].split('&')) {
  //     final indivEntryAsList = indivEntry.split('=');
  //     result[indivEntryAsList[0]] = indivEntryAsList[1];
  //   }
  // } on RangeError catch (e) {
  //   print("Error: $e");
  // }

  // return result;
//above with split

//above with regexGroups
  //start searching for = sign
  //key is from & or ? to = sign
  //value is from = sign to & or ?

  Map<String, String>? result = {};

  if (!url.startsWith("https://")) {
    return null;
  }

  final keys = RegExp(r'[?&]([^=]+)=').allMatches(url).map((element) {
    return element.group(1);
  }).toList();
  if(keys.isEmpty){
    return result;
  }
  final values = RegExp(r'(?<==)[^&?]+').allMatches(url).map((element) {
    return element.group(0);
  }).toList();

  for (var i = 0; i < keys.length; i++) {
    result[keys[i]!]= values[i]!;
  }

  return result;
}

void main() {
  final x = parseQueryParams(
      'example.com/page?param=value');
  print(x);

  // final y = parseQueryParams('https://example.com/page?param=value');
  // print(y);

  // final a = parseQueryParams('https://example.com/page');
  // print(a);

  // final b = parseQueryParams('example.com/page?param=value');
  // print(b);
}

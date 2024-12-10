```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      if (jsonBody is List) {
        // Check if each element is a map
        if (jsonBody.every((element) => element is Map<String, dynamic>)) {
          return jsonBody.cast<Map<String, dynamic>>();
        } else {
          print('Error: Unexpected JSON data structure. Expected a list of maps.');
          return null; // Or throw a more specific exception
        }
      } else {
        print('Error: Unexpected JSON data structure. Expected a list.');
        return null; // Or throw a more specific exception
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode} ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow; // Re-throw the exception for higher-level handling
  }
}
```
```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrectly assuming the response body is always a list
      final data = jsonDecode(response.body) as List<Map<String, dynamic>>;
      // ... process data ...
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Needs more specific exception handling
    print('Error: $e');
  }
}
```
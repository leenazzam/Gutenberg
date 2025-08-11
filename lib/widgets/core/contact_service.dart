import 'dart:convert';
import 'package:http/http.dart' as http;

class ContactService {
  static Future<bool> sendContactForm({
    required String name,
    required String email,
    String? phone,
    String? service,
    required String message,
  }) async {
    final uri = Uri.parse('https://formspree.io/f/xqalgjyl');

    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone': phone ?? '',
      'service': service,
      'message': message,
    };

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 202) {
        return true;
      } else {
        print('Failed to send: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error sending contact form: $e');
      return false;
    }
  }
}


import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkManager {

  final String _baseUrl;

  NetworkManager(this._baseUrl);

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(url, headers: headers);
      return response;
    } catch (e) {
      throw Exception('Erro ao fazer requisição GET: $e');
    }
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(url, headers: headers, body: jsonEncode(body));
      return response;
    } catch (e) {
      throw Exception('Erro ao fazer requisição POST: $e');
    }
  }
}

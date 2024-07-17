import 'dart:convert';

import 'package:facemask_application/data/models/response/artikel_response_model.dart';
import 'package:http/http.dart' as http;

class ArtikelDatasources {
<<<<<<< HEAD
  final baseUrl = 'http://192.168.196.85:5000';
=======
  final baseUrl = 'http://192.168.107.85:5000';
>>>>>>> f18f6de8d3e6239a1ef63dad41389910fb9da677

  Future<List<ArtikelResponseModel>> fetchArtikels() async {
    final response = await http.get(Uri.parse('$baseUrl/artikel'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => ArtikelResponseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load artikels');
    }
  }
}

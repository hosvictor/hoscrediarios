import 'dart:convert';
import 'package:hoscrediarios/models/user_details.dart';
import 'package:http/http.dart' as http;

Future<UserDetailsModel> fetchEnvironmentData() async {

  const String baseUrl = 'http://localhost:3000';

  final response = await http.get(Uri.parse('$baseUrl/environment'));

  if (response.statusCode == 200) {
    // Se o servidor retornou um 200 OK, faça o parse do JSON.
    return UserDetailsModel.fromJson(json.decode(response.body));
  } else {
    // Se a resposta não for 200, lance uma exceção.
    throw Exception('Falha ao carregar os dados');
  }
}
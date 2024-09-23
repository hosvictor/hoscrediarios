import 'dart:convert';
import 'package:hoscrediarios/models/user_details.dart';
import 'package:http/http.dart' as http;

Future<UserDetailsModel> fetchUserDetailsData() async {

  const String baseUrl = 'http://10.0.2.2:3000';

  final response = await http.get(Uri.parse('$baseUrl/user'));

  if (response.statusCode == 200) {
    // Se o servidor retornou um 200 OK, faça o parse do JSON.
    return UserDetailsModel.fromJson(json.decode(response.body));
  } else {
    // Se a resposta não for 200, lance uma exceção.
    throw Exception('Falha ao carregar os dados do usuário');
  }
}
import 'dart:convert';
import 'package:hoscrediarios/models/debt.dart';
import 'package:http/http.dart' as http;

class DebtApi {
  Future<List<DebtModel>> fetchContas() async {

    const baseUrl = 'http://192.168.0.55:3000';
    final response = await http.get(Uri.parse('$baseUrl/contas'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => DebtModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar contas');
    }
  }
}
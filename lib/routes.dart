import 'package:flutter/material.dart';
import 'package:hoscrediarios/views/screens/buy_details.dart';
import 'package:hoscrediarios/views/screens/user_details_screen.dart';
import 'package:hoscrediarios/views/screens/debt_screen.dart';
import 'package:hoscrediarios/views/screens/environments_screen.dart';
import 'package:hoscrediarios/views/screens/historic_screen.dart';
import 'package:hoscrediarios/views/screens/home_screen.dart';
import 'package:hoscrediarios/views/screens/login_screen.dart';
import 'package:hoscrediarios/views/screens/notification_screen.dart';
import 'package:hoscrediarios/views/screens/payment_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/auth_bloc.dart'; // Importe o seu BLoC de autenticação

// Função para gerar as rotas nomeadas
Route<dynamic> generateRoute(RouteSettings settings) {
  // Verifica se há argumentos passados
  final args = settings.arguments;

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen(ambiente: 2));
    case '/meus-ambientes':
      return MaterialPageRoute(builder: (_) => EnvironmentsScreen());
    case '/meu-cadastro':
      return MaterialPageRoute(builder: (_) => UserDetailsScreen());
    case '/debitos':
      return MaterialPageRoute(builder: (_) => DebtScreen());
    case '/historico':
      return MaterialPageRoute(builder: (_) => HistoricScreen());
    // case '/whatsapp':
      // return MaterialPageRoute(builder: (_) => WhatsappScreen());
    case '/notificacoes':
      return MaterialPageRoute(builder: (_) => NotificationScreen(ambiente: '1'));
    case '/detalhes-compra':
      if (args is String) {
        return MaterialPageRoute(
          builder: (_) => BuyDetails(id: args),
        );
      }
      return _erroRota();
    case '/detalhes-pagamento':
      if (args is String) {
        return MaterialPageRoute(
          builder: (_) => PaymentDetails(id: args),
        );
      }
      return _erroRota();
    default:
      return _erroRota();
  }
}

Route<dynamic> _erroRota() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: Text('Erro'),
      ),
      body: Center(
        child: Text('Rota não encontrada!'),
      ),
    ),
  );
}

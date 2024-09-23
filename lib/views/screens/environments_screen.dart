import 'package:flutter/material.dart';
import 'package:hoscrediarios/views/screens/login_screen.dart';
import 'package:hoscrediarios/views/screens/notification_screen.dart';
import 'package:hoscrediarios/views/widgets/custom_app_bar.dart';
import '../widgets/farma_card_widget.dart';
import '../../api/dummy.dart';

class EnvironmentsScreen extends StatelessWidget {
  const EnvironmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        notificationCount: 15, // Exemplo de número de notificações
        onNotificationTap: () {
          // Navega para a tela de notificações
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const NotificationScreen(ambiente: '231423')),
          );
        },
        onLogoutTap: () {
          // Lógica de logout aqui
          // Por exemplo, limpar as credenciais armazenadas e redirecionar para a tela de login
          print('Logout da aplicação');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight:
                  Radius.circular(52.0), // Borda inferior esquerda arredondada
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              color: const Color.fromRGBO(39, 79, 114, 1),
              child: Padding(
                padding: const EdgeInsets.all(34), // Padding lateral de 20
                child: Align(
                  alignment: Alignment.bottomCenter, // Alinha o texto na parte inferior
                  child: Text(
                    'SELECIONE UM AMBIENTE PARA NAVEGAR',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white, // Altere a cor do texto se necessário
                        ),
                    textAlign:
                        TextAlign.left, // Centraliza o texto horizontalmente
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: DUMMY_ENVIRONMENT.map((env) {
                return CustomCardWidget(env);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

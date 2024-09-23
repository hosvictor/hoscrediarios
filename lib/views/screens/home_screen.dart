import 'package:flutter/material.dart';
import 'package:hoscrediarios/views/screens/user_details_screen.dart';
import 'package:hoscrediarios/views/screens/debt_screen.dart';
import 'package:hoscrediarios/views/screens/historic_screen.dart';
import 'package:hoscrediarios/views/screens/login_screen.dart';
import 'package:hoscrediarios/views/screens/notification_screen.dart';
import 'package:hoscrediarios/views/widgets/custom_app_bar.dart';
import 'package:hoscrediarios/views/widgets/custom_header.dart';
import 'package:hoscrediarios/views/widgets/custom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  final int ambiente;

  const HomeScreen({super.key, required this.ambiente});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Índice da tela atual

  // Lista de widgets que representam as telas
  final List<Widget> _screens = [
    const Center(
        child: Text(
            'Home Screen')), // Substitua com o conteúdo real da tela inicial
    UserDetailsScreen(),
    DebtScreen(),
    const HistoricScreen(),
    Container(), // Placeholder para WhatsApp, pois não é uma tela real
  ];

  // Função para lidar com cliques nos itens da BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        notificationCount: 5, // Exemplo de número de notificações
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
      body: Stack(
        children: [
          // Tela atual selecionada
          _screens[_currentIndex],
          // CustomHeader fixo no topo
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomHeader(
              imageUrl:
                  'https://mbfarmacias.com.br/wp-content/uploads/2023/04/ABR23-Logo-novo-MBColorido-2.png',
              nome: 'MB Farmácias',
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// Defina este widget como reutilizável
class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  // void _launchWhatsApp() async {
    // const String phoneNumber = '5599999999999';
    // const String message = 'Olá, gostaria de saber mais informações.';
    // final String url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Não foi possível abrir o WhatsApp';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 4) {
          // _launchWhatsApp();
        } else {
          onTap(index); // Chama a função onTap passada por parâmetro
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(39, 79, 114, 1),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Área do Cliente',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Débitos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Histórico',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'WhatsApp',
        ),
      ],
    );
  }
}

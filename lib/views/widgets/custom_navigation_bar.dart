// import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // Defina este widget como reutilizável
// class CustomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CustomNavigationBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   // void _launchWhatsApp() async {
//     // const String phoneNumber = '5599999999999';
//     // const String message = 'Olá, gostaria de saber mais informações.';
//     // final String url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

//   //   if (await canLaunch(url)) {
//   //     await launch(url);
//   //   } else {
//   //     throw 'Não foi possível abrir o WhatsApp';
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: (index) {
//         if (index == 4) {
//           // _launchWhatsApp();
//         } else {
//           onTap(index); // Chama a função onTap passada por parâmetro
//         }
//       },
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: const Color.fromRGBO(39, 79, 114, 1),
//       unselectedItemColor: Colors.grey,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Início',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Área do Cliente',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.account_balance_wallet),
//           label: 'Débitos',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.history),
//           label: 'Histórico',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.whatshot),
//           label: 'WhatsApp',
//         ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class CustomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CustomNavigationBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Margem para dar o efeito flutuante
//       padding: const EdgeInsets.symmetric(vertical: 8), // Reduz altura total da navbar
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30), // Bordas arredondadas
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 15,
//             offset: const Offset(0, 8),
//           ),
//         ], // Sombra para efeito flutuante
//       ),
//       child: BottomNavigationBar(
//         currentIndex: currentIndex,
//         onTap: (index) {
//           if (index == 4) {
//             // Aqui você pode adicionar ação personalizada, como abrir o WhatsApp
//           } else {
//             onTap(index); // Chama a função onTap passada como parâmetro
//           }
//         },
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.transparent, // Fundo transparente para combinar com o container
//         elevation: 0, // Remove elevação padrão do BottomNavigationBar
//         selectedItemColor: const Color.fromRGBO(39, 79, 114, 1),
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: false, // Exibe apenas o rótulo do item selecionado
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: currentIndex == 0 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
//             ),
//             label: 'Início',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               color: currentIndex == 1 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
//             ),
//             label: 'Perfil',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.account_balance_wallet,
//               color: currentIndex == 2 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
//             ),
//             label: 'Débitos',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.history,
//               color: currentIndex == 3 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
//             ),
//             label: 'Histórico',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.whatshot,
//               color: currentIndex == 4 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
//             ),
//             label: 'WhatsApp',
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Margem para dar o efeito flutuante
      padding: const EdgeInsets.symmetric(vertical: 0), // Reduz altura total da navbar
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Bordas arredondadas
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ], // Sombra para efeito flutuante
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza o BottomNavigationBar
        children: [
          Expanded(
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                if (index == 4) {
                  // Aqui você pode adicionar ação personalizada, como abrir o WhatsApp
                } else {
                  onTap(index); // Chama a função onTap passada como parâmetro
                }
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent, // Fundo transparente para combinar com o container
              elevation: 0, // Remove elevação padrão do BottomNavigationBar
              selectedItemColor: const Color.fromRGBO(39, 79, 114, 1),
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: false, // Exibe apenas o rótulo do item selecionado
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: currentIndex == 0 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
                  ),
                  label: 'Início',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: currentIndex == 1 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
                  ),
                  label: 'Perfil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_balance_wallet,
                    color: currentIndex == 2 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
                  ),
                  label: 'Débitos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    color: currentIndex == 3 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
                  ),
                  label: 'Histórico',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.whatshot,
                    color: currentIndex == 4 ? const Color.fromRGBO(39, 79, 114, 1) : Colors.grey,
                  ),
                  label: 'WhatsApp',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

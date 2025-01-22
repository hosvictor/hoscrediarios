import 'package:flutter/material.dart';
import 'package:hoscrediarios/models/notification.dart';
import 'package:hoscrediarios/views/screens/home_screen.dart';

class CustomNotificationWidget extends StatelessWidget {
  // final bool hasNotifications; // Para verificar se há notificações
  // final bool isGeneralNotification; // Para verificar se é uma notificação geral
  // final VoidCallback onTap; // Callback para redirecionar ao ambiente

  final NotificationModel notification;
  const CustomNotificationWidget(this.notification);

  void _selectEnvironment(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_){
          return  const HomeScreen(ambiente: 1);
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return true ? GestureDetector(
      onTap: () => _selectEnvironment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // muda a posição da sombra
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            notification.date, // Formato de data simples
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '[ ${notification.environment} ]',
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        notification.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        notification.message,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_forward_ios, // Ícone de flecha
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    ) : Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nada por aqui!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Image.network(
            'https://example.com/image.png', // Substitua pela URL da sua imagem
            height: 100,
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text("Notificações")),
//       body: NotificationExample(),
//     ),
//   ));
// }

// class NotificationExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dados de exemplo
//     bool hasNotifications = true; // Altere para false para testar o estado "Nada por aqui!"
//     bool isGeneralNotification = true; // Exemplo de verificação de notificação geral

//     return NotificationWidget(
//       companyName: "Minha Empresa",
//       date: DateTime.now(),
//       title: "Título da Notificação",
//       message: "Esta é a mensagem da notificação.",
//       hasNotifications: hasNotifications,
//       isGeneralNotification: isGeneralNotification,
//       onTap: () {
//         // Verifique se a notificação é geral ou de um ambiente específico
//         if (isGeneralNotification) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => GeneralNotificationScreen()),
//           );
//         } else {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => EnvironmentNotificationScreen()),
//           );
//         }
//       },
//     );
//   }
// }
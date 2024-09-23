import 'package:flutter/material.dart';
import 'package:hoscrediarios/views/screens/environments_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
              12.0), // Adiciona espaçamento em torno da tela
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // logo HOS
              Image.asset(
                'assets/images/logo-hos.png', // Caminho para a imagem na pasta 'assets'
                width: 110, // Ajuste o tamanho conforme necessário
                height: 110,
              ),

              // const SizedBox(height: 10),

              // const SizedBox(height: 10), // Espaçamento entre o ícone e o título

              // Título
              const Text(
                'Fazer Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // const SizedBox(height: 10), // Espaçamento entre o título e o subtítulo

              // Subtítulo
              const Text(
                'HOS - CREDIÁRIOS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),

              const SizedBox(
                  height: 40), // Espaçamento entre o subtítulo e o input de CPF

              // Input de CPF
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Arredonda as bordas
                  ),
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: const Color.fromRGBO(246, 246, 246, 1),
                ),
              ),

              const SizedBox(height: 20), // Espaçamento entre os inputs

              // Input de Senha
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: const Color.fromRGBO(246, 246, 246, 1),
                ),
              ),

              const SizedBox(
                  height: 30), // Espaçamento entre o input de senha e o botão

              // Botão de Acessar
              SizedBox(
                width: double.infinity, // Faz o botão ocupar a largura total
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica de login
                    print('Tentativa de login');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EnvironmentsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(
                        39, 79, 114, 1), // Cor de fundo azul
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Bordas arredondadas
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16), // Espaçamento interno
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white, // Texto em branco
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                  height:
                      20), // Espaçamento entre o botão e o link de esqueci a senha

              // Link "Esqueci Minha Senha"
              GestureDetector(
                onTap: () {
                  // Lógica de esqueci minha senha
                  print('Esqueci minha senha');
                },
                child: const Text(
                  'Esqueci Minha Senha',
                  style: TextStyle(
                    color: Color.fromRGBO(39, 79, 114, 1), // Texto em azul
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hoscrediarios/views/screens/environments_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                   SizedBox(height: keyboardHeight == 0 ? 50 : 0),
                  // Logo HOS
                  Image.asset(
                    'assets/images/logo-hos.png',
                    width: 110,
                    height: 110,
                  ),

                  // Título
                  const Text(
                    'Fazer Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Subtítulo
                  const Text(
                    'HOS - CREDIÁRIOS',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Input de CPF
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CPF',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: const Color.fromRGBO(246, 246, 246, 1),
                    ),
                  ),

                  const SizedBox(height: 20),

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

                  const SizedBox(height: 30),

                  // Botão de Acessar
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica de login
                        print('Tentativa de login');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EnvironmentsScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(39, 79, 114, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Link "Esqueci Minha Senha"
                  GestureDetector(
                    onTap: () {
                      // Lógica de esqueci minha senha
                      print('Esqueci minha senha');
                    },
                    child: const Text(
                      'Esqueci Minha Senha',
                      style: TextStyle(
                        color: Color.fromRGBO(39, 79, 114, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
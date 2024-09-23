import 'package:flutter/material.dart';
import 'package:hoscrediarios/models/environment.dart';
import 'package:hoscrediarios/views/screens/home_screen.dart';

class CustomCardWidget extends StatelessWidget {

  final EnvironmentModel environment;
  const CustomCardWidget(this.environment);

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
    return InkWell(
      onTap: () => _selectEnvironment(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 4, // Elevação do card para um efeito de sombra
        margin: const EdgeInsets.all(10), // Margem ao redor do card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bordas arredondadas
        ),
        child: Padding(
          padding: const EdgeInsets.all(15), // Espaçamento interno
          child: Row(
            children: [
              // Imagem lateral
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Bordas arredondadas para a imagem
                child: Image.network(
                  environment.imageUrl,
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover, // Ajuste da imagem
                ),
              ),
              const SizedBox(width: 15), // Espaço entre a imagem e o texto
              // Texto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     environment.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      environment.adress,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

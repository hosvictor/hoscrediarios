import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String imageUrl;
  final String nome;

  const CustomHeader({
    super.key,
    required this.imageUrl,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3, 
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Fundo azul que ocupa metade da tela
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2, 
            color: const Color.fromRGBO(39, 79, 114, 1), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Você está navegando em',
                  // Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  
                ),
                // const SizedBox(height: 5),
                Text(
                  nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(height: 1), // Espaçamento antes da imagem circular
              ],
            ),
          ),
          // Imagem Circular com borda branca
          Positioned(
            bottom: 10, // Ajusta a posição da imagem para sobrepor o fundo azul
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Cor de fundo do círculo
                border: Border.all(
                  color: Colors.white, // Cor da borda
                  width: 6.0, // Largura da borda
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 160, // Deve ser igual ao tamanho do Container para cobrir toda a área
                  height: 160, // Deve ser igual ao tamanho do Container para cobrir toda a área
                  fit: BoxFit.cover, // A imagem será redimensionada para cobrir o espaço
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

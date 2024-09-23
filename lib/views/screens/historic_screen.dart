import 'package:flutter/material.dart';

class HistoricScreen extends StatelessWidget {
  const HistoricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de compra'),
      ),
      body: const Center(
        child: Text('Aqui estão suas compras!'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  final String id;

  PaymentDetails({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Compra'),
      ),
      body: Center(
        child: Text('ID da Compra: $id'),
      ),
    );
  }
}

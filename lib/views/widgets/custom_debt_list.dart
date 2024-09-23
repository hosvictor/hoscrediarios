import 'package:flutter/material.dart';
import 'package:hoscrediarios/models/debt.dart';

class CustomDebtList extends StatelessWidget {
  final DebtModel debt;
  final String situacao;
  final bool selected;
  final Function(bool?) onChanged;
  final VoidCallback onTap;

  CustomDebtList({
    required this.debt,
    required this.situacao,
    required this.selected,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Checkbox(
        value: selected,
        onChanged: onChanged,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(situacao, style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Valor: R\$ ${debt.valor.toStringAsFixed(2)}'),
          Text('Data de Compra: ${debt.dataCompra}'),
        ],
      ),
      trailing: Text('Vencimento: ${debt.dataVencimento}'),
    );
  }
}

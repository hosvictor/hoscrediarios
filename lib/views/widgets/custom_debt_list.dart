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
    // Formata a data de vencimento para o formato "dd/MM"
    String vencimentoFormatado = DateTime.parse(debt.dataVencimento).toLocal().toString().split(" ")[0].substring(5, 10);

    return Card(
      elevation: 2, // Sombra sutil
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Espaçamento entre os itens
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Bordas arredondadas
      ),
      child: ListTile(
        onTap: onTap,
        leading: Transform.scale(
          scale: 2, // Aumenta o tamanho da checkbox
          child: Checkbox(
            value: selected,
            onChanged: onChanged,
            activeColor: const Color.fromRGBO(39, 79, 114, 1), // Cor do checkbox quando selecionado
            checkColor: Colors.white, // Cor do ícone de seleção
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinha os itens nas extremidades
          children: [
            // Situação
            Text(
              situacao,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: situacao == 'Vencida' ? Colors.red : Colors.green, // Cor para vencida ou em aberto
              ),
            ),
            // Vencimento
            Text(
              'Vencimento: $vencimentoFormatado',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16), // Espaçamento entre a situação e o valor
            // Valor (sem quebra de linha)
            Text(
              'Valor: R\$ ${debt.valor.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Removido o laranja
              ),
            ),
            // Data de compra (sem quebra de linha)
            Text(
              'Data de Compra: ${debt.dataCompra}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600], // Cor mais suave para a data
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DebtModel {
  final int contaId;
  final double valor;
  final String dataCompra;
  final String dataVencimento;

  DebtModel({
    required this.contaId,
    required this.valor,
    required this.dataCompra,
    required this.dataVencimento,
  });

  factory DebtModel.fromJson(Map<String, dynamic> json) {
    return DebtModel(
      contaId: json['conta_id'],
      valor: (json['valor'] as num).toDouble(),
      dataCompra: json['data_compra'],
      dataVencimento: json['data_vencimento'],
    );
  }
}

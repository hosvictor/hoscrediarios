import 'package:flutter/material.dart';
import 'package:hoscrediarios/api/debt.dart';
import 'package:hoscrediarios/models/debt.dart';
import 'package:hoscrediarios/views/widgets/custom_debt_list.dart';

class DebtScreen extends StatefulWidget {
  @override
  _DebtScreenState createState() => _DebtScreenState();
}

class _DebtScreenState extends State<DebtScreen> {
  List<DebtModel> _contas = [];
  Map<int, bool> _selected = {};
  double _totalSelecionado = 0.0;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchContas();
  }

  void _fetchContas() async {
    try {
      List<DebtModel> contas = await DebtApi().fetchContas();
      setState(() {
        _contas = contas;
        _isLoading = false;
      });
    } catch (error) {
        print('Erro ao buscar contas: $error'); // Exibe o erro no console
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  void _onChanged(bool? selected, DebtModel conta) {
    setState(() {
      _selected[conta.contaId] = selected ?? false;
      _totalSelecionado = _contas
          .where((conta) => _selected[conta.contaId] == true)
          .fold(0.0, (sum, conta) => sum + conta.valor);
    });
  }

  void _showModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Copiar código da transação'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fechar'),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Contas a Pagar')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_hasError) {
      return Scaffold(
        appBar: AppBar(title: Text('Contas a Pagar')),
        body: Center(child: Text('Erro ao carregar as contas')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Contas a Pagar')),
      body: ListView.builder(
        itemCount: _contas.length,
        itemBuilder: (context, index) {
          final debt = _contas[index];
          _selected[debt.contaId] = _selected[debt.contaId] ?? false;
          final vencimento = DateTime.parse(debt.dataVencimento);
          final situacao = vencimento.isBefore(DateTime.now()) ? 'Vencida' : 'Em Aberto';

          return CustomDebtList(
            debt: debt,
            situacao: situacao,
            selected: _selected[debt.contaId]!,
            onChanged: (selected) => _onChanged(selected, debt),
            onTap: _showModal,
          );
        },
      ),
      floatingActionButton: _totalSelecionado > 0
          ? FloatingActionButton.extended(
              onPressed: _showModal,
              label: Text('Pagar [R\$ ${_totalSelecionado.toStringAsFixed(2)}]'),
            )
          : null,
    );
  }
}

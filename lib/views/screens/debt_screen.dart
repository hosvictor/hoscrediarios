import 'package:flutter/material.dart';
import 'package:hoscrediarios/api/debt.dart';
import 'package:hoscrediarios/models/debt.dart';
import 'package:hoscrediarios/views/widgets/custom_debt_list.dart';
import 'package:hoscrediarios/views/widgets/custom_header.dart';
import 'package:flutter/services.dart';


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
    backgroundColor: Colors.transparent, // Fundo transparente
    isScrollControlled: true, // Permite que o modal se ajuste ao teclado
    builder: (BuildContext context) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Ajusta para o teclado
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width * 0.8, // 80% da largura da tela
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ajusta ao tamanho necessário
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'PIX',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // QR code
                  Image.network(
                    'https://codigosdebarrasbrasil.com.br/wp-content/uploads/2019/09/codigo_qr_na_mesa-768x768.jpg',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Valor: R\$ ${_totalSelecionado.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Copia o código QR ou o valor para a área de transferência
                      Clipboard.setData(const ClipboardData(text: "Código a ser copiado"));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Código copiado para a área de transferência')),
                      );
                    },
                    child: const Text('Copiar código'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50), // Largura total
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Fechar'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50), // Largura total
                    ),
                  ),
                ],
              ),
            ),
          ),
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
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: CustomHeader(
              imageUrl:
                  'https://mbfarmacias.com.br/wp-content/uploads/2023/04/ABR23-Logo-novo-MBColorido-2.png',
              nome: 'MB Farmácias',
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0), // Espaçamento acima da ListView
              child: ListView.builder(
                itemCount: _contas.length + (_totalSelecionado > 0 ? 1 : 0), // Incrementado para incluir o espaço extra
                itemBuilder: (context, index) {
                  if (index == _contas.length && _totalSelecionado > 0) {
                    // Adiciona um espaço vazio no final da lista
                    return SizedBox(height: 80.0);
                  }

                  final debt = _contas[index];
                  _selected[debt.contaId] = _selected[debt.contaId] ?? false;
                  final vencimento = DateTime.parse(debt.dataVencimento);
                  final situacao = vencimento.isBefore(DateTime.now())
                      ? 'Vencida'
                      : 'Em Aberto';

                  return CustomDebtList(
                    debt: debt,
                    situacao: situacao,
                    selected: _selected[debt.contaId]!,
                    onChanged: (selected) => _onChanged(selected, debt),
                    onTap: _showModal,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _totalSelecionado > 0
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.78,
                child: FloatingActionButton.extended(
                  onPressed: _showModal,
                  backgroundColor: Colors.orange,
                  label: Text(
                    'Pagar [R\$ ${_totalSelecionado.toStringAsFixed(2)}]',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

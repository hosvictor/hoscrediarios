import 'package:flutter/material.dart';
import 'package:hoscrediarios/api/user_details.dart';
import 'package:hoscrediarios/models/user_details.dart';
import 'package:hoscrediarios/views/widgets/custom_header.dart';


class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          // AppBar personalizada abaixo do CustomHeader
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Ação do botão "Cancelar"
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Color.fromRGBO(39, 79, 114, 1),),
                  ),
                ),
                const Text(
                  'MEU CADASTRO',
                  style: TextStyle(
                    color:  Color.fromRGBO(39, 79, 114, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Ação do botão "Concluído"
                  },
                  child: const Text(
                    "Concluído",
                    style: TextStyle(color: Color.fromRGBO(39, 79, 114, 1),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<UserDetailsModel>(
              future: fetchUserDetailsData(), // Usando dados mockados
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar os dados'));
                } else if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildReadOnlyField("Nome Completo", user.fullName),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: buildReadOnlyField(
                                "Data de Nascimento",
                                user.birthDate,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              flex: 6,
                              child: buildReadOnlyField("Sexo", user.gender),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        buildReadOnlyField("Campo 1", user.field1),
                        SizedBox(height: 16),
                        buildReadOnlyField("Campo 2", user.field2),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: buildReadOnlyField(
                                "Telefone de Contato",
                                user.contactPhone,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              flex: 6,
                              child: buildReadOnlyField(
                                "Telefone WhatsApp",
                                user.whatsappPhone,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: buildReadOnlyField("CEP", user.cep),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              flex: 2,
                              child: buildReadOnlyField("Nº", user.number),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              flex: 4,
                              child: buildReadOnlyField(
                                "Complemento",
                                user.complement,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        buildReadOnlyField(
                          "Anexos",
                          user.attachments.join(", "),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('Nenhum dado disponível'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Método para criar campos somente leitura
  Widget buildReadOnlyField(String label, String value) {
    return TextFormField(
      initialValue: value,
      enabled: false, // Desabilita o campo para evitar edição
      decoration: InputDecoration(
        labelText: label, // O label agora está dentro do campo
        labelStyle: const TextStyle(color:Color.fromRGBO(39, 79, 114, 1),), // Estilo do label
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(39, 79, 114, 1),), // Cor da borda
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16), // Espaçamento dentro do campo
      ),
      style: const TextStyle(color: Colors.black), // Estilo do valor
    );
  }
}

void main() => runApp(MaterialApp(
      home: UserDetailsScreen(),
    ));

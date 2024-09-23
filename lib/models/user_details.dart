class UserDetailsModel {
  final String fullName;
  final String birthDate;
  final String gender;
  final String field1;
  final String field2;
  final String contactPhone;
  final String whatsappPhone;
  final String cep;
  final String number;
  final String complement;
  final List<String> attachments;

  UserDetailsModel({
    required this.fullName,
    required this.birthDate,
    required this.gender,
    required this.field1,
    required this.field2,
    required this.contactPhone,
    required this.whatsappPhone,
    required this.cep,
    required this.number,
    required this.complement,
    required this.attachments,
  });

  // Método para criar uma instância a partir de um JSON
  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      fullName: json['nome'],
      birthDate: json['data_nascimento'],
      gender: json['sexo'],
      field1: json['campo1'],
      field2: json['campo2'],
      contactPhone: json['numero_telefone'],
      whatsappPhone: json['numero_whatsapp'],
      cep: json['cep'],
      number: json['numero'],
      complement: json['compremento'],
      attachments: List<String>.from(json['arquivos']),
    );
  }
}

class EnvironmentModel {
  final int crm;
  final String name;
  final String adress;
  final String imageUrl;

  EnvironmentModel({
    required this.crm,
    required this.name,
    required this.adress,
    required this.imageUrl,
  });

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) {
    return EnvironmentModel(
      crm: json['crm'],
      name: json['name'],
      adress: json['adress'],
      imageUrl: json['imageUrl'],
    );
  }
}
class NotificationModel {
  final int notificationId;
  final int crm;
  final String title;
  final String message;
  final String environment;
  final String date;

  NotificationModel({
    required this.notificationId,
    required this.crm,
    required this.title,
    required this.message,
    required this.environment,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationId: json['notificacao_id'],
      crm: json['crm'],
      environment: json['ambiente'],
      title: json['titulo'],
      message: json['mensagem'],
      date: json['data'],
    );
  }
}
class DailyTaskModel {
  final int id;
  final int tenantId;
  final int ticketId;
  final int ticketBasketId;
  final String taskName;
  final String taskHours;
  final String type;
  final String priority;
  final String startDate;
  final String timeStatus;
  final String totalWorked;
  final int totalWorkedInMin;
  final String mainTicketId;
  final String scheduledDate;
  final String scheduledTime;
  final String status;

  DailyTaskModel({
    required this.id,
    required this.tenantId,
    required this.ticketId,
    required this.ticketBasketId,
    required this.taskName,
    required this.taskHours,
    required this.type,
    required this.priority,
    required this.startDate,
    required this.timeStatus,
    required this.totalWorked,
    required this.totalWorkedInMin,
    required this.mainTicketId,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.status,
  });

  factory DailyTaskModel.fromJson(Map<String, dynamic> json) {
    return DailyTaskModel(
      id: json['id'],
      tenantId: json['tenant_id'],
      ticketId: json['ticket_id'],
      ticketBasketId: json['ticket_basket_id'],
      taskName: json['task_name'],
      taskHours: json['task_hours'],
      type: json['type'],
      priority: json['priority'],
      startDate: json['start_date'],
      timeStatus: json['time_status'],
      totalWorked: json['total_worked'],
      totalWorkedInMin: json['total_worked_in_min'],
      mainTicketId: json['main_ticket_id'],
      scheduledDate: json['scheduled_date'],
      scheduledTime: json['scheduled_time'],
      status: json['status'],
    );
  }
}
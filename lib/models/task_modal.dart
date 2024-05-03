class TasksResponse {
  String message;
  int status;
  Data data;

  TasksResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory TasksResponse.fromJson(Map<String, dynamic> json) => TasksResponse(
        message: json["message"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  List<TotalTask> totalTask;
  List<dynamic> completeTask;
  List<dynamic> dailyTask;
  List<PreviousTask> previousTask;
  List<dynamic> upcomingTask;
  Count count;
  PieCharData pieCharData;

  Data({
    required this.totalTask,
    required this.completeTask,
    required this.dailyTask,
    required this.previousTask,
    required this.upcomingTask,
    required this.count,
    required this.pieCharData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalTask: List<TotalTask>.from(
            json["totalTask"].map((x) => TotalTask.fromJson(x))),
        completeTask: List<dynamic>.from(json["completeTask"].map((x) => x)),
        dailyTask: List<dynamic>.from(json["dailyTask"].map((x) => x)),
        previousTask: List<PreviousTask>.from(
            json["previousTask"].map((x) => PreviousTask.fromJson(x))),
        upcomingTask: List<dynamic>.from(json["upcomingTask"].map((x) => x)),
        count: Count.fromJson(json["count"]),
        pieCharData: PieCharData.fromJson(json["pieCharData"]),
      );
}

class Count {
  int pendingTask;
  int workingTask;
  int completedTask;
  int totalTask;

  Count({
    required this.pendingTask,
    required this.workingTask,
    required this.completedTask,
    required this.totalTask,
  });

  factory Count.fromJson(Map<String, dynamic> json) => Count(
        pendingTask: json["pendingTask"],
        workingTask: json["workingTask"],
        completedTask: json["completedTask"],
        totalTask: json["totalTask"],
      );
}

class PieCharData {
  int pendingTask;
  int workingTask;
  int completedTask;

  PieCharData({
    required this.pendingTask,
    required this.workingTask,
    required this.completedTask,
  });

  factory PieCharData.fromJson(Map<String, dynamic> json) => PieCharData(
        pendingTask: json["pendingTask"],
        workingTask: json["workingTask"],
        completedTask: json["completedTask"],
      );
}

class PreviousTask {
  int id;
  int tenantId;
  int ticketId;
  int ticketBasketId;
  String taskName;
  String taskHours;
  String type;
  String priority;
  String startDate;
  dynamic timeStatus;
  String totalWorked;
  int totalWorkedInMin;
  String mainTicketId;
  String endDate;
  String status;

  PreviousTask({
    required this.id,
    required this.tenantId,
    required this.ticketId,
    required this.ticketBasketId,
    required this.taskName,
    required this.taskHours,
    required this.type,
    required this.priority,
    required this.startDate,
    this.timeStatus,
    required this.totalWorked,
    required this.totalWorkedInMin,
    required this.mainTicketId,
    required this.endDate,
    required this.status,
  });

  factory PreviousTask.fromJson(Map<String, dynamic> json) => PreviousTask(
        id: json["id"],
        tenantId: json["tenant_id"],
        ticketId: json["ticket_id"],
        ticketBasketId: json["ticket_basket_id"],
        taskName: json["task_name"],
        taskHours: json["task_hours"],
        type: json["type"],
        priority: json["priority"],
        startDate: json["start_date"],
        timeStatus: json["time_status"],
        totalWorked: json["total_worked"],
        totalWorkedInMin: json["total_worked_in_min"],
        mainTicketId: json["main_ticket_id"],
        endDate: json["end_date"],
        status: json["status"],
      );
}

class TotalTask {
  int id;
  int tenantId;
  int ticketId;
  int ticketBasketId;
  String taskName;
  String taskHours;
  String type;
  String priority;
  String startDate;
  dynamic timeStatus;
  String totalWorked;
  int totalWorkedInMin;
  String mainTicketId;
  String endDate;
  String status;

  TotalTask({
    required this.id,
    required this.tenantId,
    required this.ticketId,
    required this.ticketBasketId,
    required this.taskName,
    required this.taskHours,
    required this.type,
    required this.priority,
    required this.startDate,
    this.timeStatus,
    required this.totalWorked,
    required this.totalWorkedInMin,
    required this.mainTicketId,
    required this.endDate,
    required this.status,
  });

  factory TotalTask.fromJson(Map<String, dynamic> json) => TotalTask(
        id: json["id"],
        tenantId: json["tenant_id"],
        ticketId: json["ticket_id"],
        ticketBasketId: json["ticket_basket_id"],
        taskName: json["task_name"],
        taskHours: json["task_hours"],
        type: json["type"],
        priority: json["priority"],
        startDate: json["start_date"],
        timeStatus: json["time_status"],
        totalWorked: json["total_worked"],
        totalWorkedInMin: json["total_worked_in_min"],
        mainTicketId: json["main_ticket_id"],
        endDate: json["end_date"],
        status: json["status"],
      );
}

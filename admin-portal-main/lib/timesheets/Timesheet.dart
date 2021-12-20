class Timesheet {
  final String id;
  final String name;
  final String status;
  final String phone;
  final String email;
  final String weekEndDate;
  final String hours;
  final String client;
  final String frequency;

  const Timesheet(
      {required this.email,
      required this.id,
      required this.name,
      required this.status,
      required this.phone,
      required this.weekEndDate,
      required this.hours,
      required this.client,
      required this.frequency});
}

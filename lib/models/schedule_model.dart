import 'package:anydoctorhere/models/doctor_model.dart';

class Schedule {
  final Doctor doctor;
  final String status;
  final DateTime time;

  Schedule({
    required this.doctor,
    required this.status,
    required this.time,
  });
}

List<Schedule> schedules = [
  Schedule(
      doctor: doctors[4],
      status: 'Confirmed',
      time: DateTime.now().add(Duration(hours: 2))),
  Schedule(
      doctor: doctors[0],
      status: 'Confirmed',
      time: DateTime.now().add(Duration(hours: 5))),
  Schedule(
      doctor: doctors[1],
      status: 'Confirmed',
      time: DateTime.now().add(Duration(days: 3))),
  Schedule(
      doctor: doctors[2],
      status: 'Confirmed',
      time: DateTime.now().add(Duration(days: 4))),
  Schedule(
      doctor: doctors[3],
      status: 'Confirmed',
      time: DateTime.now().add(Duration(days: 10))),
  Schedule(
      doctor: doctors[2],
      status: 'Confirmed',
      time: DateTime.now().add(Duration(days: 5))),
];

List<String> tabs = ['Upcoming', 'Completed', 'Canceled'];

List<Schedule> nearest = schedules
    .where(
      (element) =>
          element.time.year == DateTime.now().year &&
          element.time.month == DateTime.now().month &&
          element.time.day == DateTime.now().day,
    )
    .toList();
List<Schedule> futures = schedules
    .where(
      (element) =>
          element.time.isAfter(DateTime.now()) ||
          element.time.isAtSameMomentAs(DateTime.now().add(Duration(days: 1))),
    )
    .toList();

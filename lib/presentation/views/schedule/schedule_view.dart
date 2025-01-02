import 'package:anydoctorhere/models/schedule_model.dart';
import 'package:anydoctorhere/presentation/shared/sectionheader_widget.dart';
import 'package:anydoctorhere/presentation/views/schedule/widgets/visitcard_widget.dart';
import 'package:flutter/material.dart';

class SchedulingView extends StatefulWidget {
  const SchedulingView({super.key});

  @override
  State<SchedulingView> createState() => _SchedulingViewState();
}

class _SchedulingViewState extends State<SchedulingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        //Filters

        // Appointments and schedule
        children: [
          Text('Schedule',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SectionHeader(title: 'Nearest visit'),
          Column(spacing: 10, children: [
            ...List.generate(nearest.length, (index) {
              return VisitCard(visitScheduled: schedules[index]);
            })
          ]),
          SectionHeader(title: 'Future visits'),
          Column(children: [
            ...List.generate(futures.length, (index) {
              return VisitCard(visitScheduled: schedules[index]);
            })
          ]),
        ],
      ),
    )));
  }
}

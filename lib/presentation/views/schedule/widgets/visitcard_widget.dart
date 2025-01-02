import 'package:anydoctorhere/models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VisitCard extends StatelessWidget {
  final Schedule visitScheduled;

  const VisitCard({super.key, required this.visitScheduled});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      width: MediaQuery.of(context).size.width / 0.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(4, 4),
                blurRadius: 5,
                spreadRadius: 0.1),
          ]),
      child: Column(
        children: [
          // Doctor info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    visitScheduled.doctor.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    visitScheduled.doctor.specialty,
                    style: TextStyle(color: Colors.blueGrey),
                  )
                ],
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(visitScheduled.doctor.image),
              ),
            ],
          ),
          // Visit info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat('MM/dd/yyyy').format(visitScheduled.time)),
              Text(DateFormat('hh:mm a').format(visitScheduled.time)),
              Text(visitScheduled.status),
            ],
          ),
          // Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                ),
                onPressed: () {},
                child: Text('Cancel'),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
                ),
                onPressed: () {},
                child: Text('Reschedule'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

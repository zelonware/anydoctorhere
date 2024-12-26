import 'package:anydoctorhere/models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  final Doctor doctor;

  const DoctorList({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      width: MediaQuery.of(context).size.width / 2.25,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(4, 4),
                blurRadius: 5,
                spreadRadius: 0.1),
          ]),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(doctor.image),
          ),
          Text(
            'Dr. ${doctor.name}',
            style: TextStyle(
                fontSize: 15, letterSpacing: -.5, fontWeight: FontWeight.bold),
          ),
          Text(
            doctor.specialty,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.orange, size: 15),
                Text(rate(doctor).toStringAsFixed(1))
              ],
            ),
          )
        ],
      ),
    );
  }
}

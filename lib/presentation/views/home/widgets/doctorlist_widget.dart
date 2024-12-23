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
                blurRadius: 1,
                spreadRadius: 1),
          ]),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(doctor.image),
          ),
          Text(doctor.name)
        ],
      ),
    );
  }
}

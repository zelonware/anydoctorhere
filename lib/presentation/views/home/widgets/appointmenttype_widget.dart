import 'package:flutter/material.dart';

class AppointmentType extends StatelessWidget {
  final String callToAction;
  final String appointmentType;
  final IconData appointmentIcon;
  final Color bgColor;

  const AppointmentType(
      {super.key,
      required this.callToAction,
      required this.appointmentType,
      required this.appointmentIcon,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1),
        ], color: bgColor, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(appointmentIcon,
                size: 40,
                color: bgColor == Colors.white ? Colors.black : Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              appointmentType,
              style: TextStyle(
                  fontSize: 20,
                  color: bgColor == Colors.white ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(callToAction,
                style: TextStyle(
                    fontSize: 18,
                    color:
                        bgColor == Colors.white ? Colors.black : Colors.white))
          ],
        ),
      ),
    );
  }
}

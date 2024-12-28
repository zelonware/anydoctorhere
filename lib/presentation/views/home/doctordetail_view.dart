import 'package:anydoctorhere/models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorDetailView extends StatelessWidget {
  final Doctor doctor;
  const DoctorDetailView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      extendBody: true,
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [],
            ),
          ),
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(doctor.image),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Dr. ${doctor.name}",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Specialist on ${doctor.specialty}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                color: Colors.blue,
                padding: EdgeInsets.all(15),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                color: Colors.blue,
                child: Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)))),
          )
        ],
      )),
    );
  }
}

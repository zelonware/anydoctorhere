import 'package:anydoctorhere/presentation/views/home/widgets/appointmenttype_widget.dart';
import 'package:anydoctorhere/presentation/shared/sectionheader_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome, patient!
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome, patient 👋🏻',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/008/957/225/non_2x/female-doctor-avatar-clipart-icon-in-flat-design-vector.jpg'),
                ),
              ],
            ),
          ),
          // Visit type
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppointmentType(
                  appointmentType: 'Clinic visit',
                  callToAction: 'Make an appointment',
                  appointmentIcon: Icons.add_circle,
                  bgColor: Colors.purple,
                ),
                SizedBox(
                  width: 10,
                ),
                AppointmentType(
                  appointmentType: 'Home visit',
                  callToAction: 'Call the doctor home',
                  appointmentIcon: Icons.home_filled,
                  bgColor: Colors.white,
                )
              ],
            ),
          ),
          // Symptons options
          SectionHeader(title: 'What are your symptons?'),
          // Popular doctors
          SectionHeader(title: 'Popular doctors'),
        ],
      ),
    );
  }
}

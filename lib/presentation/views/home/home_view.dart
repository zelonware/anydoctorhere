import 'package:anydoctorhere/models/doctor_model.dart';
import 'package:anydoctorhere/presentation/views/doctordetail/doctordetail_view.dart';
import 'package:anydoctorhere/presentation/views/home/widgets/appointmenttype_widget.dart';
import 'package:anydoctorhere/presentation/shared/sectionheader_widget.dart';
import 'package:anydoctorhere/presentation/views/home/widgets/doctorlist_widget.dart';
import 'package:anydoctorhere/presentation/views/home/widgets/symptonbox_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Map<String, String> symptons = {
    '🤒': 'Temperature',
    '🤧': 'Sneezing',
    '🤕': 'Headache',
    '😵‍💫': 'Dizzy'
  };

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
                  'Welcome! 👋🏻',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      "https://raw.githubusercontent.com/zelonware/anydoctorhere/refs/heads/main/img/user.png",
                    )),
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
                  bgColor: Colors.lightBlue,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                    symptons.length,
                    (ind) => Padding(
                        padding: ind == 0
                            ? EdgeInsets.only(left: 15, right: 15)
                            : EdgeInsets.only(right: 15),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: SymptonBox(
                              symptonName: symptons.values.elementAt(ind),
                              symptonIcon: symptons.keys.elementAt(ind),
                            ))))
              ],
            ),
          ),
          // Popular doctors
          SectionHeader(title: 'Popular doctors'),
          Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 3,
                  children: [
                ...List.generate(
                  doctors.length,
                  (ind) => GestureDetector(
                    child: DoctorList(doctor: doctors[ind]),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  DoctorDetailView(doctor: doctors[ind])));
                    },
                  ),
                )
              ]))
        ],
      ),
    );
  }
}

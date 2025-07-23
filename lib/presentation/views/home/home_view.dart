import 'package:anydoctorhere/models/doctor_model.dart';
import 'package:anydoctorhere/presentation/views/doctordetail/doctordetail_view.dart';
import 'package:anydoctorhere/presentation/views/home/widgets/appointmenttype_widget.dart';
import 'package:anydoctorhere/presentation/shared/sectionheader_widget.dart';
import 'package:anydoctorhere/presentation/views/home/widgets/doctorlist_widget.dart';
import 'package:anydoctorhere/presentation/views/home/widgets/symptonbox_widget.dart';
import 'package:anydoctorhere/services/service_locator.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _doctorService = ServiceLocator().doctorService;
  List<Doctor> doctors = [];
  bool isLoading = true;
  String? errorMessage;

  Map<String, String> symptons = {
    '🤒': 'Temperature',
    '🤧': 'Sneezing',
    '🤕': 'Headache',
    '😵‍💫': 'Dizzy'
  };

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  Future<void> _loadDoctors() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });
      
      final loadedDoctors = await _doctorService.getAllDoctors();
      
      setState(() {
        doctors = loadedDoctors;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

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
                                color: Colors.grey,
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
            child: _buildDoctorsSection(),
          )
        ],
      ),
    );
  }

  Widget _buildDoctorsSection() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading doctors',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadDoctors,
              child: const Text('Try again'),
            ),
          ],
        ),
      );
    }

    if (doctors.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medical_services_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No available doctors',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return GridView.count(
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
                  builder: (_) => DoctorDetailView(doctor: doctors[ind]),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

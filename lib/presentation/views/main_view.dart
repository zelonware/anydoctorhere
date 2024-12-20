import 'package:anydoctorhere/presentation/views/home/home_view.dart';
import 'package:anydoctorhere/presentation/views/messages_view.dart';
import 'package:anydoctorhere/presentation/views/schedule_view.dart';
import 'package:anydoctorhere/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedPage = 0;
  final pages = [
    const HomeView(),
    const MessagesView(),
    const SchedulingView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.deepPurple,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          showUnselectedLabels: true,
          currentIndex: selectedPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined), label: 'Messages'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: 'Schedule'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}

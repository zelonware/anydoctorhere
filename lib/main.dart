import 'package:anydoctorhere/presentation/views/main_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnyDoctorApp());
}

class AnyDoctorApp extends StatelessWidget {
  const AnyDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Any doctor here?',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainView(),
    );
  }
}

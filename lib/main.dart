import 'package:anydoctorhere/presentation/views/main_view.dart';
import 'package:flutter/material.dart';

import 'package:anydoctorhere/services/service_locator.dart';

void main() {
  ServiceLocator().initialize();
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

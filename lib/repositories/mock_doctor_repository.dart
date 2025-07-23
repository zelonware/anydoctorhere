import 'package:anydoctorhere/models/doctor_model.dart';
import 'package:anydoctorhere/repositories/doctor_repository.dart';

class MockDoctorRepository implements DoctorRepository {
  // Simular delay de red
  static const Duration _networkDelay = Duration(milliseconds: 500);

  @override
  Future<List<Doctor>> getAllDoctors() async {
    await Future.delayed(_networkDelay);
    return doctors;
  }

  @override
  Future<Doctor?> getDoctorById(int id) async {
    await Future.delayed(_networkDelay);
    try {
      return doctors.firstWhere((doctor) => doctor.doctorId == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Doctor>> getDoctorsBySpecialty(String specialty) async {
    await Future.delayed(_networkDelay);
    return doctors
        .where((doctor) => 
            doctor.specialty.toLowerCase().contains(specialty.toLowerCase()))
        .toList();
  }

  @override
  Future<List<Doctor>> searchDoctors(String query) async {
    await Future.delayed(_networkDelay);
    final lowerQuery = query.toLowerCase();
    return doctors
        .where((doctor) =>
            doctor.name.toLowerCase().contains(lowerQuery) ||
            doctor.specialty.toLowerCase().contains(lowerQuery) ||
            doctor.location.toLowerCase().contains(lowerQuery))
        .toList();
  }
}

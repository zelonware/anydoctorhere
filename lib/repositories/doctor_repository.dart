import 'package:anydoctorhere/models/doctor_model.dart';

abstract class DoctorRepository {
  Future<List<Doctor>> getAllDoctors();
  Future<Doctor?> getDoctorById(int id);
  Future<List<Doctor>> getDoctorsBySpecialty(String specialty);
  Future<List<Doctor>> searchDoctors(String query);
}

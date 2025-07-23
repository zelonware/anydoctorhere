import 'package:anydoctorhere/models/doctor_model.dart';
import 'package:anydoctorhere/repositories/doctor_repository.dart';

class DoctorService {
  final DoctorRepository _repository;

  DoctorService(this._repository);

  Future<List<Doctor>> getAllDoctors() async {
    try {
      return await _repository.getAllDoctors();
    } catch (e) {
      throw Exception('Error al obtener los doctores: $e');
    }
  }

  Future<Doctor?> getDoctorById(int id) async {
    try {
      return await _repository.getDoctorById(id);
    } catch (e) {
      throw Exception('Error al obtener el doctor con ID $id: $e');
    }
  }

  Future<List<Doctor>> getDoctorsBySpecialty(String specialty) async {
    try {
      return await _repository.getDoctorsBySpecialty(specialty);
    } catch (e) {
      throw Exception('Error al obtener doctores por especialidad "$specialty": $e');
    }
  }

  Future<List<Doctor>> searchDoctors(String query) async {
    try {
      if (query.trim().isEmpty) {
        return await getAllDoctors();
      }
      return await _repository.searchDoctors(query);
    } catch (e) {
      throw Exception('Error al buscar doctores con query "$query": $e');
    }
  }

  Future<List<String>> getSpecialties() async {
    try {
      final doctors = await getAllDoctors();
      final specialties = doctors
          .map((doctor) => doctor.specialty)
          .toSet()
          .toList()
        ..sort();
      return specialties;
    } catch (e) {
      throw Exception('Error al obtener especialidades: $e');
    }
  }

  Future<double> getDoctorAverageRating(int doctorId) async {
    try {
      final doctor = await getDoctorById(doctorId);
      if (doctor == null) return 0.0;
      return rate(doctor);
    } catch (e) {
      throw Exception('Error al calcular rating promedio del doctor $doctorId: $e');
    }
  }
}

import 'package:anydoctorhere/models/review_model.dart';
import 'package:anydoctorhere/models/doctor_model.dart';
import 'package:anydoctorhere/repositories/review_repository.dart';

class MockReviewRepository implements ReviewRepository {
  // Simular delay de red
  static const Duration _networkDelay = Duration(milliseconds: 300);

  @override
  Future<List<Review>> getAllReviews() async {
    await Future.delayed(_networkDelay);
    return reviews;
  }

  @override
  Future<Review?> getReviewById(int id) async {
    await Future.delayed(_networkDelay);
    try {
      return reviews.firstWhere((review) => review.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Review>> getReviewsByDoctorId(int doctorId) async {
    await Future.delayed(_networkDelay);
    final doctor = doctors.firstWhere((d) => d.doctorId == doctorId);
    return doctor.reviews;
  }

  @override
  Future<List<Review>> getReviewsByRating(double minRating) async {
    await Future.delayed(_networkDelay);
    return reviews.where((review) => review.rate >= minRating).toList();
  }
}

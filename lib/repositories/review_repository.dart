import 'package:anydoctorhere/models/review_model.dart';

abstract class ReviewRepository {
  Future<List<Review>> getAllReviews();
  Future<Review?> getReviewById(int id);
  Future<List<Review>> getReviewsByDoctorId(int doctorId);
  Future<List<Review>> getReviewsByRating(double minRating);
}

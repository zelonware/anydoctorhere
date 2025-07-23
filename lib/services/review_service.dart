import 'package:anydoctorhere/models/review_model.dart';
import 'package:anydoctorhere/repositories/review_repository.dart';

class ReviewService {
  final ReviewRepository _repository;

  ReviewService(this._repository);

  Future<List<Review>> getAllReviews() async {
    try {
      return await _repository.getAllReviews();
    } catch (e) {
      throw Exception('Error al obtener las reseñas: $e');
    }
  }

  Future<Review?> getReviewById(int id) async {
    try {
      return await _repository.getReviewById(id);
    } catch (e) {
      throw Exception('Error al obtener la reseña con ID $id: $e');
    }
  }

  Future<List<Review>> getReviewsByDoctorId(int doctorId) async {
    try {
      return await _repository.getReviewsByDoctorId(doctorId);
    } catch (e) {
      throw Exception('Error al obtener reseñas del doctor $doctorId: $e');
    }
  }

  Future<List<Review>> getReviewsByRating(double minRating) async {
    try {
      return await _repository.getReviewsByRating(minRating);
    } catch (e) {
      throw Exception('Error al obtener reseñas con rating mínimo $minRating: $e');
    }
  }

  Future<List<Review>> getTopRatedReviews({int limit = 5}) async {
    try {
      final allReviews = await getAllReviews();
      allReviews.sort((a, b) => b.rate.compareTo(a.rate));
      return allReviews.take(limit).toList();
    } catch (e) {
      throw Exception('Error al obtener las mejores reseñas: $e');
    }
  }

  Future<double> getAverageRating() async {
    try {
      final allReviews = await getAllReviews();
      if (allReviews.isEmpty) return 0.0;
      
      final totalRating = allReviews.fold(0.0, (sum, review) => sum + review.rate);
      return totalRating / allReviews.length;
    } catch (e) {
      throw Exception('Error al calcular el rating promedio: $e');
    }
  }

  Future<double> getAverageRatingForDoctor(int doctorId) async {
    try {
      final doctorReviews = await getReviewsByDoctorId(doctorId);
      if (doctorReviews.isEmpty) return 0.0;
      
      final totalRating = doctorReviews.fold(0.0, (sum, review) => sum + review.rate);
      return totalRating / doctorReviews.length;
    } catch (e) {
      throw Exception('Error al calcular el rating promedio del doctor $doctorId: $e');
    }
  }

  Future<Map<String, int>> getReviewsCountByRating() async {
    try {
      final allReviews = await getAllReviews();
      final Map<String, int> ratingCounts = {
        '5 estrellas': 0,
        '4+ estrellas': 0,
        '3+ estrellas': 0,
        '2+ estrellas': 0,
        '1+ estrellas': 0,
      };

      for (final review in allReviews) {
        if (review.rate >= 5.0) ratingCounts['5 estrellas'] = ratingCounts['5 estrellas']! + 1;
        else if (review.rate >= 4.0) ratingCounts['4+ estrellas'] = ratingCounts['4+ estrellas']! + 1;
        else if (review.rate >= 3.0) ratingCounts['3+ estrellas'] = ratingCounts['3+ estrellas']! + 1;
        else if (review.rate >= 2.0) ratingCounts['2+ estrellas'] = ratingCounts['2+ estrellas']! + 1;
        else ratingCounts['1+ estrellas'] = ratingCounts['1+ estrellas']! + 1;
      }

      return ratingCounts;
    } catch (e) {
      throw Exception('Error al obtener el conteo de reseñas por rating: $e');
    }
  }
}

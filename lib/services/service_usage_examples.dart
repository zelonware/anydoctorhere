import 'package:anydoctorhere/services/service_locator.dart';

/// Ejemplo de cómo usar los servicios creados
/// 
/// Para usar estos servicios en tu aplicación:
/// 
/// 1. Inicializa el ServiceLocator en tu main.dart:
/// ```dart
/// void main() {
///   ServiceLocator().initialize();
///   runApp(MyApp());
/// }
/// ```
/// 
/// 2. Usa los servicios en tus widgets o controllers:
/// ```dart
/// class HomeController {
///   final _doctorService = ServiceLocator().doctorService;
///   final _reviewService = ServiceLocator().reviewService;
/// 
///   Future<void> loadDoctors() async {
///     try {
///       final doctors = await _doctorService.getAllDoctors();
///       // Procesar lista de doctores
///     } catch (e) {
///       // Manejar error
///       print('Error: $e');
///     }
///   }
/// 
///   Future<void> searchDoctors(String query) async {
///     try {
///       final results = await _doctorService.searchDoctors(query);
///       // Procesar resultados de búsqueda
///     } catch (e) {
///       // Manejar error
///       print('Error: $e');
///     }
///   }
/// 
///   Future<void> loadReviewsForDoctor(int doctorId) async {
///     try {
///       final reviews = await _reviewService.getReviewsByDoctorId(doctorId);
///       // Procesar reseñas del doctor
///     } catch (e) {
///       // Manejar error
///       print('Error: $e');
///     }
///   }
/// }
/// ```
/// 
/// 3. En tus widgets, puedes usar FutureBuilder:
/// ```dart
/// class DoctorListWidget extends StatelessWidget {
///   final _doctorService = ServiceLocator().doctorService;
/// 
///   @override
///   Widget build(BuildContext context) {
///     return FutureBuilder(
///       future: _doctorService.getAllDoctors(),
///       builder: (context, snapshot) {
///         if (snapshot.connectionState == ConnectionState.waiting) {
///           return CircularProgressIndicator();
///         }
///         
///         if (snapshot.hasError) {
///           return Text('Error: ${snapshot.error}');
///         }
///         
///         final doctors = snapshot.data ?? [];
///         return ListView.builder(
///           itemCount: doctors.length,
///           itemBuilder: (context, index) {
///             final doctor = doctors[index];
///             return ListTile(
///               title: Text(doctor.name),
///               subtitle: Text(doctor.specialty),
///               // ... más código del widget
///             );
///           },
///         );
///       },
///     );
///   }
/// }
/// ```

class ServiceUsageExamples {
  static Future<void> demonstrateUsage() async {
    // Inicializar el localizador de servicios
    ServiceLocator().initialize();
    
    final doctorService = ServiceLocator().doctorService;
    final reviewService = ServiceLocator().reviewService;
    
    try {
      // Ejemplo 1: Obtener todos los doctores
      print('=== Obteniendo todos los doctores ===');
      final allDoctors = await doctorService.getAllDoctors();
      print('Doctores encontrados: ${allDoctors.length}');
      
      // Ejemplo 2: Buscar un doctor específico
      print('\n=== Buscando doctor por ID ===');
      final doctor = await doctorService.getDoctorById(1);
      if (doctor != null) {
        print('Doctor encontrado: ${doctor.name} - ${doctor.specialty}');
      }
      
      // Ejemplo 3: Buscar doctores por especialidad
      print('\n=== Buscando doctores por especialidad ===');
      final pediatricians = await doctorService.getDoctorsBySpecialty('Pediatrician');
      print('Pediatras encontrados: ${pediatricians.length}');
      
      // Ejemplo 4: Búsqueda general
      print('\n=== Búsqueda general ===');
      final searchResults = await doctorService.searchDoctors('Chris');
      print('Resultados de búsqueda: ${searchResults.length}');
      
      // Ejemplo 5: Obtener especialidades disponibles
      print('\n=== Especialidades disponibles ===');
      final specialties = await doctorService.getSpecialties();
      print('Especialidades: ${specialties.join(', ')}');
      
      // Ejemplo 6: Obtener reseñas de un doctor
      print('\n=== Reseñas de un doctor ===');
      final reviews = await reviewService.getReviewsByDoctorId(1);
      print('Reseñas del doctor 1: ${reviews.length}');
      
      // Ejemplo 7: Obtener mejores reseñas
      print('\n=== Mejores reseñas ===');
      final topReviews = await reviewService.getTopRatedReviews(limit: 3);
      print('Top 3 reseñas:');
      for (final review in topReviews) {
        print('- ${review.fullname}: ${review.rate} estrellas');
      }
      
      // Ejemplo 8: Rating promedio general
      print('\n=== Rating promedio general ===');
      final averageRating = await reviewService.getAverageRating();
      print('Rating promedio: ${averageRating.toStringAsFixed(2)}');
      
      // Ejemplo 9: Conteo de reseñas por rating
      print('\n=== Distribución de ratings ===');
      final ratingCounts = await reviewService.getReviewsCountByRating();
      ratingCounts.forEach((rating, count) {
        print('$rating: $count reseñas');
      });
      
    } catch (e) {
      print('Error en el ejemplo: $e');
    }
  }
}

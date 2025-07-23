import 'package:anydoctorhere/repositories/doctor_repository.dart';
import 'package:anydoctorhere/repositories/mock_doctor_repository.dart';
import 'package:anydoctorhere/repositories/review_repository.dart';
import 'package:anydoctorhere/repositories/mock_review_repository.dart';
import 'package:anydoctorhere/services/doctor_service.dart';
import 'package:anydoctorhere/services/review_service.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  // Repositorios
  late final DoctorRepository _doctorRepository;
  late final ReviewRepository _reviewRepository;

  // Servicios
  late final DoctorService _doctorService;
  late final ReviewService _reviewService;

  bool _initialized = false;

  void initialize() {
    if (_initialized) return;

    // Inicializar repositorios mock
    _doctorRepository = MockDoctorRepository();
    _reviewRepository = MockReviewRepository();

    // Inicializar servicios
    _doctorService = DoctorService(_doctorRepository);
    _reviewService = ReviewService(_reviewRepository);

    _initialized = true;
  }

  // Getters para los servicios
  DoctorService get doctorService {
    if (!_initialized) initialize();
    return _doctorService;
  }

  ReviewService get reviewService {
    if (!_initialized) initialize();
    return _reviewService;
  }

  // Getters para los repositorios (por si se necesitan directamente)
  DoctorRepository get doctorRepository {
    if (!_initialized) initialize();
    return _doctorRepository;
  }

  ReviewRepository get reviewRepository {
    if (!_initialized) initialize();
    return _reviewRepository;
  }

  // Método para cambiar a implementaciones reales de API cuando sea necesario
  void switchToApiRepositories({
    DoctorRepository? doctorRepository,
    ReviewRepository? reviewRepository,
  }) {
    if (doctorRepository != null) {
      _doctorRepository = doctorRepository;
      _doctorService = DoctorService(_doctorRepository);
    }
    
    if (reviewRepository != null) {
      _reviewRepository = reviewRepository;
      _reviewService = ReviewService(_reviewRepository);
    }
  }
}

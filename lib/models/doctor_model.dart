import 'package:anydoctorhere/models/review_model.dart';

class Doctor {
  final int doctorId;
  final String name, specialty, about, location, image;
  final int price;
  final int color;
  final List<Review> reviews;

  const Doctor({
    required this.doctorId,
    required this.name,
    required this.specialty,
    required this.about,
    required this.location,
    required this.image,
    required this.color,
    required this.price,
    required this.reviews,
  });
}

List<Doctor> doctors = [
  Doctor(
    doctorId: 1,
    name: "Chris Frazier",
    specialty: "Pediatrician",
    about: about,
    location: "123 Main St, Springfield",
    price: 59,
    image:
        "https://raw.githubusercontent.com/zelonware/anydoctorhere/refs/heads/main/img/doctor1.png",
    color: 0xFFffcdcf,
    reviews: [reviews[0], reviews[1], reviews[2], reviews[3], reviews[4]],
  ),
  Doctor(
    doctorId: 2,
    name: "Viola Dunn",
    specialty: "Therapist",
    about: about,
    location: "3516 W. Gray St. Utica, Pennsylvania",
    price: 52,
    image:
        "https://raw.githubusercontent.com/zelonware/anydoctorhere/refs/heads/main/img/doctor2.png",
    color: 0xFFf9d8b9,
    reviews: [
      reviews[5],
      reviews[6],
      reviews[7],
    ],
  ),
  Doctor(
    doctorId: 3,
    name: "Liuka Leehane",
    specialty: "Orthopedics",
    about: about,
    location: "357 Spruce Ln, Bostont",
    price: 53,
    image:
        "https://raw.githubusercontent.com/zelonware/anydoctorhere/refs/heads/main/img/doctor3.png",
    color: 0xFFccd1fa,
    reviews: [reviews[3], reviews[2], reviews[1]],
  ),
  Doctor(
    doctorId: 4,
    name: "John Smith",
    specialty: "Neurologists",
    about: about,
    location: "68 Stoughton Terrace",
    price: 80,
    image:
        "https://raw.githubusercontent.com/zelonware/anydoctorhere/refs/heads/main/img/doctor4.png",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[4], reviews[6], reviews[7]],
  ),
  Doctor(
    doctorId: 5,
    name: "Raj Patel",
    specialty: "Emergency Medicine",
    about: about,
    location: "654 Pine St, Miami",
    price: 80,
    image:
        "https://raw.githubusercontent.com/zelonware/anydoctorhere/refs/heads/main/img/doctor5.png",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[3], reviews[5]],
  )
//   Doctor(
//     doctorId: 6,
//     name: "Sarah Lee",
//     specialist: "Neurologists",
//     about: about,
//     location: "789 Oak St, Los Angeles",
//     price: 54,
//     image:
//         "https://static.vecteezy.com/system/resources/previews/028/251/987/non_2x/doctor-3d-icon-illustration-free-png.png",
//     color: 0xFF11583c,
//     reviews: [
//       reviews[0],
//       reviews[2],
//       reviews[4],
//       reviews[7],
//     ],
//   ),
//   Doctor(
//     doctorId: 7,
//     name: "Michael Brown",
//     specialist: "Psychiatry",
//     about: about,
//     location: "246 Cedar Blvd, Denver",
//     price: 76,
//     image:
//         "https://static.vecteezy.com/system/resources/previews/028/251/981/non_2x/doctor-3d-icon-illustration-free-png.png",
//     color: 0xFFf9d8b9,
//     reviews: [reviews[5], reviews[3], reviews[4], reviews[2], reviews[7]],
//   ),
//   Doctor(
//     doctorId: 8,
//     name: "David Jones",
//     specialist: "Cardiologists",
//     about: about,
//     location: "767 Old Gate Trail",
//     price: 57,
//     image:
//         "https://static.vecteezy.com/system/resources/previews/028/213/351/non_2x/doctor-3d-icon-illustration-free-png.png",
//     color: 0xFFffcdcf,
//     reviews: [
//       reviews[3],
//       reviews[5],
//     ],
//   ),
//   Doctor(
//     doctorId: 9,
//     name: "Robert Davis",
//     specialist: "Orthopedics",
//     about: about,
//     location: "746 Rutledge Center",
//     price: 55,
//     image:
//         "https://static.vecteezy.com/system/resources/previews/028/196/369/non_2x/doctor-3d-icon-illustration-free-png.png",
//     color: 0xFFf9d8b9,
//     reviews: [reviews[1], reviews[5], reviews[7], reviews[0]],
//   ),
//   Doctor(
//     doctorId: 10,
//     name: "Linda Wilson",
//     specialist: "Dermatology",
//     about: about,
//     location: "283 Northview Park",
//     price: 56,
//     image:
//         "https://static.vecteezy.com/system/resources/previews/028/238/992/non_2x/doctor-3d-icon-illustration-free-png.png",
//     color: 0xFFffcdcf,
//     reviews: [reviews[1], reviews[4], reviews[3]],
//   ),
];
const about =
    "is an experienced specialist who is constantly working on improving her skills.";

rate(Doctor doctor) {
  double rate = 0;
  for (var element in doctor.reviews) {
    rate += element.rate;
  }
  return rate / doctor.reviews.length;
}

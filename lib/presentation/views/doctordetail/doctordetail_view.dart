import 'package:anydoctorhere/models/doctor_model.dart';
import 'package:anydoctorhere/presentation/shared/starrating_widget.dart';
import 'package:anydoctorhere/presentation/views/doctordetail/widgets/reviewcard_widget.dart';
import 'package:flutter/material.dart';

class DoctorDetailView extends StatelessWidget {
  final Doctor doctor;
  const DoctorDetailView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      extendBody: true,
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [],
            ),
          ),
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(doctor.image),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Dr. ${doctor.name}",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Specialist on ${doctor.specialty}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                color: Colors.blue,
                padding: EdgeInsets.all(15),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                color: Colors.blue,
                child: Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // about
                    Text(
                      'About them',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text('${doctor.name} ${doctor.about}'),
                    SizedBox(
                      height: 10,
                    ),
                    // reviews
                    Row(
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        StarRating(rating: rate(doctor)),
                        SizedBox(
                          width: 5,
                        ),
                        Text('(${doctor.reviews.length})')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                                doctor.reviews.length,
                                (ind) =>
                                    ReviewCard(review: doctor.reviews[ind]))
                          ],
                        )),

                    // location
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey,
                      child: Text('Location'),
                    ),
                    // booking
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.blueAccent,
                      child: Text('Book now'),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
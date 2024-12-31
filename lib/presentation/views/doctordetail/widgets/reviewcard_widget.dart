import 'package:anydoctorhere/models/review_model.dart';
import 'package:anydoctorhere/presentation/shared/starrating_widget.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.22,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(review.image),
                  radius: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(review.fullname), Text(review.date)],
                ),
                SizedBox(
                  width: 15,
                ),
                StarRating(rating: review.rate)
              ],
            ),
            Text(
              review.comment,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 15,
                letterSpacing: 0,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

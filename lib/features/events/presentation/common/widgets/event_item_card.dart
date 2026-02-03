import 'package:camabelcommunity/core/constants/app_images.dart';
import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_type.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/event_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventItemCard extends StatelessWidget {
  final Event event;
  const EventItemCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => EventDetailScreen(event: event)));
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.asset(
                AppImages.defaultEvent,
                height: 300,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  stops: [0.01, 0.35],
                  begin: AlignmentGeometry.bottomCenter,
                  end: AlignmentGeometry.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: CustomColors.darkBlue,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      EventType.mass.label,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    event.date.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

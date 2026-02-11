import 'package:camabelcommunity/core/constants/app_images.dart';
import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_type.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/common/widgets/image_expendable_card.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/event_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => EventDetailScreen(event: event)),
          );
        },
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
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
                    borderRadius: BorderRadiusGeometry.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      stops: [0.001, 0.20],
                      begin: AlignmentGeometry.bottomCenter,
                      end: AlignmentGeometry.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 14,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "26",
                          style: TextStyle(
                            height: 1,
                            fontWeight: FontWeight.w900,
                            color: CustomColors.darkBlue,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "NOV",
                          style: TextStyle(
                            height: 1,
                            fontWeight: FontWeight.w900,
                            color: CustomColors.darkBlue,
                            fontSize: 25,
                          ),
                        ),

                        Text(
                          "2026",
                          style: TextStyle(
                            height: 1,
                            fontWeight: FontWeight.w900,
                            color: CustomColors.darkBlue,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       padding: EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //         color: CustomColors.darkBlue,
                  //         borderRadius: BorderRadius.circular(50),
                  //       ),
                  //       child: Text(
                  //         EventType.mass.label,
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //         ),
                  //       ),
                  //     ),
                  //     // SizedBox(height: 5),
                  //     // Text(
                  //     //   event.date.toString(),
                  //     //   style: TextStyle(
                  //     //     color: Colors.white,
                  //     //     fontWeight: FontWeight.bold,
                  //     //     fontSize: 25,
                  //     //   ),
                  //     // ),
                  //   ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: CustomColors.darkBlue.withValues(alpha: 0.75),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "MESSE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "Forum Saint-Michel",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "12:30",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.white),
                      Text(
                        "Bd Saint-Michel 24, 1040 Bruxelles",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
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

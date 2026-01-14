import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/event_detail_screen.dart';
import 'package:flutter/material.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Evenements"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),
            Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => EventDetailScreen()),
                  );
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: Image.asset(
                        "img/messe_noel_2025.jpg",
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
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: CustomColors.darkBlue,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              "Messe",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Vendredi 15 décembre 2025\n1150 Bruxelles",
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
            ),
            SizedBox(height: 5),
            Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.asset(
                      "img/messe_simple.jpg",
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
                  Positioned(child: Column()),
                ],
              ),
            ),
            SizedBox(height: 5),
            Card(
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.asset(
                      "img/messe_noel_2025.jpg",
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
                    left: 20,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Text(
                            "Messe",

                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Vendredi 15 décembre 2025\n1150 Bruxelles",
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
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

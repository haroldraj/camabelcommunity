import 'package:camabelcommunity/main.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messe")),
      body: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => MyHomePage(title: "Programme liturjique"),
            ),
          );
        },
        child: Text("Programme liturjique"),
      ),
    );
  }
}

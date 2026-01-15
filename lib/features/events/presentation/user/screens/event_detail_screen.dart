import 'package:camabelcommunity/features/events/data/datasources/mock/mock_day_program.dart';
import 'package:camabelcommunity/features/events/domain/enums/program_type.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/mass_program_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = "Messe du ${DateFormat("d/MM/yyyy").format(DateTime.now())}";
    final programItems = mockDayProgram;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: programItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(programItems[index]["title"]!),
            trailing:
                programItems[index]["type"] == ProgramType.massProgram.name
                ? IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MassProgramScreen()),
                      );
                    },
                  )
                : null,
          );
        },
      ),
    );
  }
}

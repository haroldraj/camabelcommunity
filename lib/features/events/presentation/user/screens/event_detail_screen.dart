import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/data/datasources/mock/build_mock_day_program_items.dart';
import 'package:camabelcommunity/features/events/data/datasources/mock/mock_mass_programs.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/mass_program_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends StatefulWidget {
  final Event event;
  const EventDetailScreen({super.key, required this.event});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventsBloc>().add(GetEventsRequested());
  }

  @override
  Widget build(BuildContext context) {
    final title =
        "Programme du ${DateFormat("d/MM/yyyy").format(widget.event.date)}";
    final massPrograms = mockMassPrograms;
    final dayProgramItems = buildMockDayProgramItems(
      baseDate: widget.event.date,
      massProgram: massPrograms[0],
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: dayProgramItems.length,
            itemBuilder: (BuildContext context, int index) {
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    // Text(
                    //   DateFormat.Hm("fr_FR").format(dayProgramItems[index].startAt),
                    //   style: TextStyle(fontSize: 20),
                    // ),
                    SizedBox(
                      width: 40,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: index % 2 == 0 ? 6 : 1,
                                color: CustomColors.darkBlue,
                              ),
                              // color: CustomColors.darkBlue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Expanded(
                            child: VerticalDivider(
                              thickness: 0.5,
                              color: CustomColors.darkBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            DateFormat.Hm(
                              "fr_FR",
                            ).format(dayProgramItems[index].startAt),
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            dayProgramItems[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: CustomColors.darkBlue,
                            ),
                          ),
                          Text(
                            dayProgramItems[index].description ?? "",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          dayProgramItems[index].massProgram != null
                              ? Row(
                                  mainAxisAlignment: .end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => MassProgramScreen(
                                              massProgram:
                                                  dayProgramItems[index]
                                                      .massProgram!,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Ouvrir le programme liturjique...",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),

                          SizedBox(height: 35),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              // return Card(
              //   elevation: 0.1,
              //   color: Colors.white,
              //   child: ListTile(
              //     title: Text(dayProgramItems[index].title),
              //     trailing:
              //         dayProgramItems[index].type.name ==
              //             ProgramType.massProgram.name
              //         ? IconButton(
              //             icon: Icon(Icons.arrow_forward_ios),
              //             onPressed: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (_) => MassProgramScreen(
              //                     massProgram: dayProgramItems[index].massProgram!,
              //                   ),
              //                 ),
              //               );
              //             },
              //           )
              //         : null,
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}

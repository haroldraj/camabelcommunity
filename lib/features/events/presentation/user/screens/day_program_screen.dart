import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/day_programs/day_programs_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/mass_program_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DayProgramScreen extends StatefulWidget {
  final String dayProgramId;
  const DayProgramScreen({super.key, required this.dayProgramId});

  @override
  State<DayProgramScreen> createState() => _DayProgramScreenState();
}

class _DayProgramScreenState extends State<DayProgramScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DayProgramsBloc>().add(
      GetDayProgramByIdRequested(widget.dayProgramId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = "Programme du jour";
    //${DateFormat("d/MM/yyyy").format(widget.event.date)}";
    // final massPrograms = mockMassPrograms;
    // final dayProgramItems = buildMockDayProgramItems(
    //   baseDate: widget.event.date,
    //   massProgram: massPrograms[0],
    // );

    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: BlocListener<DayProgramsBloc, DayProgramsState>(
        listener: (context, state) {
          if (state is DayProgramsFailure) {
            showDialog(
              barrierDismissible: false,
              context: context,

              builder: (_) => AlertDialog(
                title: Text("Error", style: TextStyle(color: Colors.red[800])),
                content: Text(state.errorMessage),
                backgroundColor: Colors.white,
                // actions: [
                //   TextButton(
                //     onPressed: () => Navigator.pop(context),
                //     child: Text("OK"),
                //   ),
                // ],
              ),
            );
          }
        },

        child: BlocBuilder<DayProgramsBloc, DayProgramsState>(
          builder: (context, state) {
            if (state is! DayProgramsSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Chargement du programme..."),
                  ],
                ),
              );
            }

            final dayProgram = state.dayProgram;

            return ListView.builder(
              itemCount: dayProgram.items.length,
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
                              ).format(dayProgram.items[index].startAt),
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              dayProgram.items[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: CustomColors.darkBlue,
                              ),
                            ),
                            Text(
                              dayProgram.items[index].description ?? "",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            dayProgram.items[index].massProgramId != null
                                ? Row(
                                    mainAxisAlignment: .end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => MassProgramScreen(
                                                massProgramId:
                                                    dayProgram.items[index].id,
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
      ),
    );
  }
}

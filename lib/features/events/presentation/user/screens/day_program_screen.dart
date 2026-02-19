import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/domain/enums/program_type.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/day_program/day_program_bloc.dart';
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
    context.read<DayProgramBloc>().add(
      GetDayProgramByIdRequested(widget.dayProgramId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = "Programme du jour";

    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: BlocListener<DayProgramBloc, DayProgramState>(
        listener: (context, state) {
          if (state is DayProgramFailure) {
            showDialog(
              barrierDismissible: false,
              context: context,

              builder: (_) => AlertDialog(
                title: Text("Error", style: TextStyle(color: Colors.red[800])),
                content: Text(state.errorMessage),
                backgroundColor: Colors.white,
                actions: [
                 TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).maybePop();
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          }
        },

        child: BlocBuilder<DayProgramBloc, DayProgramState>(
          builder: (context, state) {
            if (state is DayProgramLoading) {
              return Center(child: const CircularProgressIndicator());
            }
            if (state is DayProgramSuccess) {
              final dayProgram = state.dayProgram;

              return RefreshIndicator(
                backgroundColor: Colors.white,
                onRefresh: () async => context.read<DayProgramBloc>().add(
                  GetDayProgramByIdRequested(widget.dayProgramId),
                ),
                child: ListView.builder(
                  itemCount: dayProgram.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: .start,
                        children: [
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
                                  ).format(dayProgram.items[index].startAt!),
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
                                dayProgram.items[index].massProgramId != null &&
                                        dayProgram.items[index].type ==
                                            ProgramType.massProgram
                                    ? Row(
                                        mainAxisAlignment: .end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      MassProgramScreen(
                                                        massProgramId:
                                                            dayProgram
                                                                .items[index]
                                                                .massProgramId!,
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
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

import 'package:camabelcommunity/core/dependency_injection.dart';
import 'package:camabelcommunity/core/theme/app_theme.dart';
import 'package:camabelcommunity/data_upload.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/day_program/day_program_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/mass_program/mass_program_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/song/song_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/upcoming_event_screeen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

var logger = Logger();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setup();
  await initializeDateFormatting("fr_FR");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<EventsBloc>()),
        BlocProvider(create: (context) => sl<DayProgramBloc>()),
        BlocProvider(create: (context) => sl<MassProgramBloc>()),
        BlocProvider(create: (context) => sl<SongBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Camabel Community',
        theme: appTheme,
        home:DataUpload(),
      ),
    );
  }
}

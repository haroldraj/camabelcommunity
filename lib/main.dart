import 'package:camabelcommunity/core/dependency_injection.dart';
import 'package:camabelcommunity/core/theme/app_theme.dart';
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
  // void main() {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setup();
  await initializeDateFormatting("fr_FR");
  // runApp(const InitializeApp());

  runApp(MyApp());
}

class InitializeApp extends StatelessWidget {
  const InitializeApp({super.key});

  Future<void> _init() async {
    await Firebase.initializeApp();
    await initializeDateFormatting("fr_FR");
    await setup();
    logger.i("Setup done");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          logger.e("Error Firebase");
          return FirebaseError();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          logger.i("Firebase connection done");
          return MyApp();
        }
        logger.i("Firebase Loading");
        return FirebaseLoading();
      },
    );
  }
}

class FirebaseError extends StatelessWidget {
  const FirebaseError({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text("Firebase Error"))),
    );
  }
}

class FirebaseLoading extends StatelessWidget {
  const FirebaseLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text("Firebase Loading"))),
    );
  }
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
        home: UpcomingEventScreeen(),
      ),
    );
  }
}


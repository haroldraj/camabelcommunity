import 'package:camabelcommunity/core/dependency_injection.dart';
import 'package:camabelcommunity/core/enums/screen_uri_path.dart';
import 'package:camabelcommunity/core/theme/app_theme.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/day_program/day_program_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/mass_program/mass_program_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/song/song_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/day_program_screen.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/event_history_screen.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/mass_program_screen.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/song_lyrics_screen.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/upcoming_event_screeen.dart';
import 'package:camabelcommunity/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

var logger = Logger();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setup();
  await initializeDateFormatting("fr_FR");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final String homePath = ScreenUriPath.home.label;

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
        initialRoute: homePath,
        // home: UpcomingEventScreeen(),
        onGenerateRoute: (settings) {
          final uri = Uri.parse(settings.name ?? homePath);

          if (uri.path == homePath) {
            return MaterialPageRoute(
              builder: (_) => UpcomingEventScreeen(),
              settings: settings,
            );
          }

          if (uri.path == ScreenUriPath.eventHistory.label) {
            return MaterialPageRoute(
              builder: (_) => EventHistoryScreen(),
              settings: settings,
            );
          }

          if (uri.path == ScreenUriPath.dayProgram.label) {
            final dayProgramId = uri.queryParameters["dayProgramId"];
            if (dayProgramId == null || dayProgramId.isEmpty) {
              return MaterialPageRoute(
                builder: (_) =>
                    const UnknownRouteScreen(message: "Missing dayProgramId"),
                settings: settings,
              );
            }
            return MaterialPageRoute(
              builder: (_) => DayProgramScreen(dayProgramId: dayProgramId),
              settings: settings,
            );
          }

          if (uri.path == ScreenUriPath.massProgram.label) {
            final massProgramId = uri.queryParameters["massProgramId"];
            if (massProgramId == null || massProgramId.isEmpty) {
              return MaterialPageRoute(
                builder: (_) =>
                    const UnknownRouteScreen(message: "Missing massProgramId"),
                settings: settings,
              );
            }
            return MaterialPageRoute(
              builder: (_) => MassProgramScreen(massProgramId: massProgramId),
              settings: settings,
            );
          }

          if (uri.path == ScreenUriPath.song.label) {
            final songId = uri.queryParameters["songId"];
            final songTitle = uri.queryParameters['title'] ?? '';

            if (songId == null || songId.isEmpty) {
              return MaterialPageRoute(
                builder: (_) =>
                    const UnknownRouteScreen(message: "Missing songId"),
                settings: settings,
              );
            }
            return MaterialPageRoute(
              builder: (_) =>
                  SongLyricsScreen(songId: songId, songTitle: songTitle),
              settings: settings,
            );
          }
          return MaterialPageRoute(
            builder: (_) => const UnknownRouteScreen(message: "Page not found"),
            settings: settings,
          );
        },
      ),
    );
  }
}

class UnknownRouteScreen extends StatelessWidget {
  final String message;
  const UnknownRouteScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camabel Community")),
      body: Center(child: Text(message)),
    );
  }
}

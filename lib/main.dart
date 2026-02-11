import 'package:camabelcommunity/core/dependency_injection.dart';
import 'package:camabelcommunity/core/theme/app_theme.dart';
import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_events.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/home_screen.dart';
// import 'package:camabelcommunity/models/song_model.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/event_list_screen.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/mass_program_screen.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/song_lyrics_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

var logger = Logger();
Future<void> main() async {
  // void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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

  Future<void> print_song() async {
    final dataReference = FirebaseFirestore.instance;
    final songs = dataReference.collection("songs").get();
    Logger().i(songs);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EventsBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Camabel Community',
        theme: appTheme,
        // home: Scaffold(
        //   floatingActionButton: FloatingActionButton(
        //     onPressed: () {
        //       print_song();
        //     },
        //   ),
        // ),
        home: HomeScreen(),
      ),

      // home: HomeScreen(),
      // home: MassProgramScreen(),
      //home: EventListScreen(getEvents: ,),
      //home: const MyHomePage(title: 'Camabel Community'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final databaseReference = FirebaseFirestore.instance;

  void testDataSending() {
    try {
      databaseReference
          .collection("songs")
          .add({
            "title": "Zaho mino an'ilay Zagnahary",
            "book": null,
            "page": 45,
            "lyrics": """
Zaho mino, zaho mino
Zaho mino an'ilay Zagnahary e

1-  Zaho mino an'i Zagnahary
Nanao ny lanitra sy ny tany
Zaho mino an'i Jesoa Tompo
Zanany tokana Tompontsika e e e

Naterak'i Maria virjiny
Dia nijaly sy nampahoriana
Nofantsihana tamin'ny hazo
Dia maty ary koa nalevina e e e

Fa nony tonga kosa tamin'ny andro fahatelo
Nitsangana Izy e e e
Dia nipetraka eo an-kavanan-dRay
Velona Izy e e (4)

Zaho mino, zaho mino
Zaho mino an'ilay Zagnahary e

2-  Niakatra any an-danitra Izy
Nipetraka eo an-kavanan'ny Ray
Mbola ho avy amim-boninahitra
Hitsara ny velona sy ny maty e e e

Zaho mino ny Fanahy Masina
Tompo sy loharanon'aina
Tsaohina sy omem-boninahitra
Miaraka amin'ny Ray sy ny Zanaka e e e

Zaho mino ny Eglizy masin'i Kristy
Tompontsika e e
Ny Batemy tokana manala ny fahotana
Mino isika e e (4)
                      """,
            "keywords": ["zaho", "mino", "zagnahary"],
          })
          .then((onValue) => logger.i("Success: song id: ${onValue.id}"));
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.title)),
      body: Column(children: [Expanded(child: ListSection())]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          testDataSending();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListSection extends StatelessWidget {
  ListSection({super.key});
  final dataReference = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dataReference.collection("songs").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No songs found"));
        }

        return ListView(
          children: snapshot.data!.docs.map((document) {
            return ListTile(
              title: TextButton(
                onPressed: () {
                  // final songModel = Song();
                  // songModel.title = document["title"],
                  //   document["book"],
                  //   document["page"],
                  //   List<String>.from(document["keywords"] ?? []),
                  //   document["lyrics"] as String,
                  // );
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) => SongLyricsScreen(songModel: songModel),
                  //   ),
                  // );
                },
                child: Text(
                  "Rakitra: ${document["title"]} - Hasina P. ${document["page"] ?? ""}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

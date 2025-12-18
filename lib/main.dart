import 'package:camabelcommunity/core/theme/app_theme.dart';
import 'package:camabelcommunity/models/song_model.dart';
import 'package:camabelcommunity/screens/events/event_list_screen.dart';
import 'package:camabelcommunity/screens/mass_program_screen.dart';
import 'package:camabelcommunity/screens/song_lyrics_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

var logger = Logger();
void main() {
  runApp(const InitializeApp());
}

class InitializeApp extends StatelessWidget {
  const InitializeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camabel Community',
      theme: appTheme,
      home: MassProgramScreen(),
      //home: EventListScreen(),
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
                  final SongModel songModel = SongModel(
                    document["title"],
                    document["book"],
                    document["page"],
                    List<String>.from(document["keywords"] ?? []),
                    document["lyrics"] as String,
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SongLyricsScreen(songModel: songModel),
                    ),
                  );
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

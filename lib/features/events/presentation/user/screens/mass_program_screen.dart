import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/song_lyrics_screen.dart';
import 'package:flutter/material.dart';

class MassProgramScreen extends StatelessWidget {
  const MassProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Programme de la messe"), centerTitle: true),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Fidirana",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Mesia sy mpamonjy", style: TextStyle(fontSize: 20)),
                    Text(
                      "Hasina P. 56",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {
                  final song = Song(
                    id: "id",
                    title: "Mesia sy mapmonjy",
                    keywords: ["Messy", "mpamonjy"],
                    hasLyrics: true,
                    lyrics: """
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
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SongLyricsScreen(song: song),
                    ),
                  );
                },
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Fifonana",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Diso taminao", style: TextStyle(fontSize: 20)),
                    Text(
                      "Hasina P. 303",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.menu_book_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Vakiteny voalohany",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                subtitle: Text(
                  "Boki'Izaia Mpaminany 11,1-10",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Salamo",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Nirahina hitory vaovao mahafaly i Kristy",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 218",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.menu_book_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Vakiteny faharoa",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Taratasin'I Md Paoly Apôstôly ho an'ny kristianina tany Rôma 15, 4-9",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 447",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Fihobiana ny Evanjely",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "(Aleloia) aleloia e! Arahaba, ry Renin'Antriamanitra e ia, Aleloia!",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 447",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.menu_book_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Vakiteny Evanjely",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Md. Joany 21, 1-14", style: TextStyle(fontSize: 20)),
                    Text(
                      "Hasina P. 447",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Fiekem-pinoana",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Zaho mino an'ilay Zañahary (Kerobina)",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 447",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Ranombavaka",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Ekeo, ry Tompo, izao vavakay izao (indroa)",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 447",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Rakitra",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Vory eto izahay", style: TextStyle(fontSize: 20)),
                    Text(
                      "Hasina P. 142",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Fanolorana",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Mofo sy divay e no atolotray aminao, ry Tompo",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 172",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Masina",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Masiñy Ana Zañahary", style: TextStyle(fontSize: 20)),
                    Text(
                      "Hasina P. 778",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Fanandratana",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Nitsangana tamin'ny maty i Jesoa Mpamonjy antsika",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 76",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Rainay",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Rainay any an-danitra",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 447",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.handshake, color: CustomColors.darkBlue),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Fiadanana",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Homba antsika mianakavy anie",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 772",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Zanak'ondry",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Zanak'ondry (beso)", style: TextStyle(fontSize: 20)),
                    Text(
                      "Hasina P. 447",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Komonio",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Raha te ho sambatra ianao",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 189",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Fisaorana",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Isaorana ianao", style: TextStyle(fontSize: 20)),
                    Text(
                      "Hasina P. 447",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.music_note_outlined,
                  color: CustomColors.darkBlue,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.darkBlue,
                ),
                title: Text(
                  "Fanirahana",
                  style: TextStyle(
                    color: CustomColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Aterinay anatrehanao, Reny",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Hasina P. 80",
                      style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

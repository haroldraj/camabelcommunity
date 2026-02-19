import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/song_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/song_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SongFirestoreDatasourceImpl implements SongFirestoreDatasource {
  final FirebaseFirestore firestore;

  SongFirestoreDatasourceImpl(this.firestore);

  CollectionReference<Map<String, dynamic>> get _songsRef =>
      firestore.collection("songs");

  @override
  Future<SongModel> getSongById(String id) async {
    try {
      final doc = await _songsRef.doc(id).get();
      if (doc.data() == null || !doc.exists) {
        throw Exception("Song not found with id: $id");
      }
      return SongModel.fromJson(doc.data()!, id: doc.id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

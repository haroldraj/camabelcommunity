import 'package:camabelcommunity/features/events/data/datasources/remote_datasource/event_remote_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventRemoteDatasourceWithMockDataImpl implements EventRemoteDatasource {
  final FirebaseFirestore firestore;

  EventRemoteDatasourceWithMockDataImpl(this.firestore);

  CollectionReference<Map<String, dynamic>> get _eventsRef =>
      firestore.collection("events");

  @override
  Future<String> createEvent(EventModel event) async {
    try {
      final doc = _eventsRef.doc(event.id);
      await doc.set(event.toJson());
      return doc.id;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

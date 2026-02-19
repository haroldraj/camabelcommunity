import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/event_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventFirestoreDatasourceImpl implements EventFirestoreDatasource {
  final FirebaseFirestore firestore;

  EventFirestoreDatasourceImpl(this.firestore);

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

  @override
  Future<List<EventModel>> getAllUpcomingEvents() async {
    try {
      return [];
      //final events = await _eventsRef.get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

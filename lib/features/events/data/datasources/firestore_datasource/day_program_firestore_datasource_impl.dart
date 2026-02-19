import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/day_program_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_item_model.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DayProgramFirestoreDatasourceImpl
    implements DayProgramFirestoreDatasource {
  final FirebaseFirestore firestore;

  DayProgramFirestoreDatasourceImpl(this.firestore);

  CollectionReference<Map<String, dynamic>> get _dayProgramsRef =>
      firestore.collection("dayPrograms");

  @override
  Future<DayProgramModel> getDayProgamById(String id) async {
    try {
      final doc = await _dayProgramsRef.doc(id).get();
      if (doc.data() == null || !doc.exists) {
        throw Exception("DayProgram not found with id: $id");
      }
      final DayProgramModel dayProgram = DayProgramModel.fromJson(
        doc.data()!,
        id: doc.id,
      );
      final itemsSnapshot = await _dayProgramsRef
          .doc(id)
          .collection("items")
          .orderBy("startAt")
          .get();

      final List<DayProgramItemModel> items = itemsSnapshot.docs
          .map((item) => DayProgramItemModel.fromJson(item.data(), id: item.id))
          .toList();

      return dayProgram.copywith(items: items);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

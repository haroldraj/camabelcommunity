import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/mass_program_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_item_model.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MassProgramFirestoreDatasourceImpl
    implements MassProgramFirestoreDatasource {
  final FirebaseFirestore firestore;

  MassProgramFirestoreDatasourceImpl(this.firestore);

  CollectionReference<Map<String, dynamic>> get _massProgramsRef =>
      firestore.collection("massPrograms");

  @override
  Future<MassProgramModel> getMassProgramById(String id) async {
    try {
      final doc = await _massProgramsRef.doc(id).get();
      if (!doc.exists || doc.data() == null) {
        throw Exception("MassProgrem not found with id: $id");
      }

      final MassProgramModel massProgram = MassProgramModel.fromJson(
        doc.data()!,
        id: doc.id,
      );

      final itemsSnapshot = await _massProgramsRef
          .doc(id)
          .collection("items")
          .orderBy("order")
          .get();

      final List<MassProgramItemModel> items = itemsSnapshot.docs
          .map(
            (item) => MassProgramItemModel.fromJson(item.data(), id: item.id),
          )
          .toList();

      return massProgram.copywith(items: items);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

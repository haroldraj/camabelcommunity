import 'dart:convert';

import 'package:camabelcommunity/core/dependency_injection.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_model.dart';
import 'package:camabelcommunity/features/events/data/models/event_model.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_model.dart';
import 'package:camabelcommunity/features/events/data/models/song_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/web.dart';

class DataUpload extends StatefulWidget {
  const DataUpload({super.key});

  @override
  State<DataUpload> createState() => _DataUploadState();
}

class _DataUploadState extends State<DataUpload> {
  final logger = Logger();
  Future<void> _pushData() async {
    try {
      final db = sl<FirebaseFirestore>();

      final basePath = "assets/data_sample";
      final eventJson = await rootBundle.loadString("$basePath/events.json");
      final List<dynamic> eventData = await json.decode(eventJson);
      final eventModels = eventData
          .map((event) => EventModel.fromJson(event))
          .toList();
      logger.i("Events: $eventModels");
      logger.i("\nSending events...");
      for (final event in eventModels) {
        db.collection("events").doc(event.id).set(event.toJson());
      }
      logger.i("\nEvents sent.");

      final dayProgramJson = await rootBundle.loadString(
        "$basePath/day_programs.json",
      );
      final List<dynamic> dayProgramData = await json.decode(dayProgramJson);
      final dayProgramModels = dayProgramData
          .map((song) => DayProgramModel.fromJson(song))
          .toList();
      logger.i("DayPrograms: $dayProgramModels");
      logger.i("\nSending dayPrograms...");
      for (final dayProgram in dayProgramModels) {
        db
            .collection("dayPrograms")
            .doc(dayProgram.id)
            .set(dayProgram.toJson());
        for (final item in dayProgram.items) {
          db
              .collection("dayPrograms")
              .doc(dayProgram.id)
              .collection("items")
              .doc(item.id)
              .set(item.toJson());
        }
      }
      logger.i("\nDayPrograms sent.");

      final massProgramJson = await rootBundle.loadString(
        "$basePath/mass_programs.json",
      );
      final List<dynamic> massProgramData = await json.decode(massProgramJson);
      final massProgramModels = massProgramData
          .map((massProgram) => MassProgramModel.fromJson(massProgram))
          .toList();
      logger.i("MassPrograms: $massProgramModels");
      logger.i("\nSending massPrograms...");
      for (final massProgram in massProgramModels) {
        db
            .collection("massPrograms")
            .doc(massProgram.id)
            .set(massProgram.toJson());
        for (final item in massProgram.items) {
          db
              .collection("massPrograms")
              .doc(massProgram.id)
              .collection("items")
              .doc(item.id)
              .set(item.toJson());
        }
      }
      logger.i("\nMassPrograms sent.");

      final songJson = await rootBundle.loadString("$basePath/songs.json");
      final List<dynamic> songData = await json.decode(songJson);
      final songModels = songData
          .map((song) => SongModel.fromJson(song))
          .toList();
      logger.i("Songs: $songModels");
      logger.i("\nSending songs...");
      for (final song in songModels) {
        db.collection("songs").doc(song.id).set(song.toJson());
      }
      logger.i("\nSongs sent.");
    } catch (e) {
      logger.e("Error: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pushData(),
        child: Icon(Icons.add),
      ),
    );
  }
}

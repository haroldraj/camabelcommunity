import 'dart:convert';

import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_model.dart';
import 'package:camabelcommunity/features/events/data/models/event_model.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_item_model.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_model.dart';
import 'package:camabelcommunity/features/events/data/models/song_model.dart';
import 'package:flutter/services.dart';
import 'package:logger/web.dart';

class EmbeddedDatasourceImpl implements EmbeddedDatasource {
  final String _basePath = "assets/data_sample";

  @override
  Future<List<EventModel>> getAllEvents() async {
    try {
      final String response = await rootBundle.loadString(
        "$_basePath/events.json",
      );
      final List<dynamic> data = await json.decode(response);
      Logger().i(data);
      return data.map((event) => EventModel.fromJson(event)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<DayProgramModel>> getAllDayPrograms() async {
    try {
      final String response = await rootBundle.loadString(
        "$_basePath/day_programs.json",
      );
      final List<dynamic> data = await json.decode(response);

      return data.map((item) => DayProgramModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<MassProgramItemModel>> getAllMassProgramItems() async {
    try {
      final response = await rootBundle.loadString(
        "$_basePath/mass_program_items.json",
      );
      final List<dynamic> data = json.decode(response);

      return data.map((item) => MassProgramItemModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<MassProgramModel>> getAllMassPrograms() async {
    try {
      final String response = await rootBundle.loadString(
        "$_basePath/mass_programs.json",
      );
      final List<dynamic> data = await json.decode(response);

      return data.map((mass) => MassProgramModel.fromJson(mass)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<SongModel>> getAllSongs() async {
    try {
      final String response = await rootBundle.loadString(
        "$_basePath/songs.json",
      );

      final List<dynamic> data = await json.decode(response);

      return data.map((song) => SongModel.fromJson(song)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<DayProgramModel> getDayProgramById(String id) async {
    try {
      final List<DayProgramModel> dayPrograms = await getAllDayPrograms();
      return dayPrograms.firstWhere((dayProgram) => dayProgram.id == id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

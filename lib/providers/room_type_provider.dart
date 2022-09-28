import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/room_type_model.dart';
import 'package:flutter/material.dart';

// Provider for all room types of the hotel
class RoomTypeProvider extends ChangeNotifier {
  List<RoomType> _roomTypes = [];
  UnmodifiableListView get roomTypes => UnmodifiableListView(_roomTypes);

  DBHelper myDatabase = DBHelper();

  // Method to get all room types from database
  Future<void> getAllRoomTypes() async {
    await myDatabase.hotelDatabase();
    _roomTypes = await myDatabase.getAll('room_type') as List<RoomType>;
    notifyListeners();
  }

  String getRoomType(int typeId) {
    var t = _roomTypes.firstWhere((type) => type.id == typeId);
    return t.name;
  }
}

import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/room_reserved_model.dart';
import 'package:flutter/material.dart';

class RoomReservedProvider extends ChangeNotifier {
  List<RoomReserved> _roomsReserved = [];
  UnmodifiableListView get roomsReserved =>
      UnmodifiableListView(_roomsReserved);

  DBHelper myDatabase = DBHelper();

  // Insert new room reserved into database
  Future<void> insertNewRoomReserved(RoomReserved model) async {
    await myDatabase.hotelDatabase();
    _roomsReserved.add(model);
    await myDatabase.insert(model);
    notifyListeners();
  }

  // Method to get all rooms reserved from database
  Future<void> getAllRoomsReserved() async {
    await myDatabase.hotelDatabase();
    _roomsReserved =
        await myDatabase.getAll('room_reserved') as List<RoomReserved>;
    notifyListeners();
  }
}

import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/guest_model.dart';
import 'package:flutter/material.dart';

class GuestProvider extends ChangeNotifier {
  List<Guest> _guests = [];
  UnmodifiableListView get guests => UnmodifiableListView(_guests);

  DBHelper myDatabase = DBHelper();

  // Insert new guest into database
  Future<void> insertNewGuest(Guest model) async {
    await myDatabase.hotelDatabase();
    _guests.add(model);
    await myDatabase.insert(model);
    notifyListeners();
  }

  // Method to get all guests from database
  Future<void> getAlGuests() async {
    await myDatabase.hotelDatabase();
    _guests = await myDatabase.getAll('guest') as List<Guest>;
    notifyListeners();
  }
}

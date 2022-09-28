import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/reservation_model.dart';
import 'package:flutter/material.dart';

class ReservationProvider extends ChangeNotifier {
  List<Reservation> _reservations = [];
  UnmodifiableListView get reservations => UnmodifiableListView(_reservations);

  DBHelper myDatabase = DBHelper();

  // Insert new reservation into database
  Future<void> insertNewGuest(Reservation model) async {
    await myDatabase.hotelDatabase();
    _reservations.add(model);
    await myDatabase.insert(model);
    notifyListeners();
  }

  // Method to get all reservations from database
  Future<void> getAllReservations() async {
    await myDatabase.hotelDatabase();
    _reservations = await myDatabase.getAll('reservation') as List<Reservation>;
    notifyListeners();
  }
}

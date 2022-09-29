import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/reservation_status_catalog_model.dart';
import 'package:flutter/material.dart';

// Provider for all reservation catalogs of the hotel
class ReservationCatalogProvider extends ChangeNotifier {
  List<ReservationStatusCatalog> _reservationCatalogs = [];
  UnmodifiableListView get reservationCatalogs =>
      UnmodifiableListView(_reservationCatalogs);

  DBHelper myDatabase = DBHelper();

  // Method to get all reservationCatalogs from database
  Future<void> getAllResCatalogs() async {
    await myDatabase.hotelDatabase();
    _reservationCatalogs = await myDatabase.getAll('reservation_status_catalog')
        as List<ReservationStatusCatalog>;
    notifyListeners();
  }

  // Get Reservaiton status catalog using id
  String getStatusCatalog(int id) {
    ReservationStatusCatalog catalog =
        _reservationCatalogs.firstWhere((cat) => cat.id == id);
    return catalog.name;
  }
}

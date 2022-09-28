import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/country_model.dart';
import 'package:flutter/material.dart';

// Provider for all branches of the hotel
class CountryProvider extends ChangeNotifier {
  List<Country> _countries = [];
  UnmodifiableListView get countries => UnmodifiableListView(_countries);

  DBHelper myDatabase = DBHelper();

  // Method to get all countries from database
  Future<void> getAllCountries() async {
    await myDatabase.hotelDatabase();
    _countries = await myDatabase.getAll('country') as List<Country>;
    notifyListeners();
  }
}

import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/city_model.dart';
import 'package:flutter/material.dart';

// Provider for all branches of the hotel
class CityProvider extends ChangeNotifier {
  List<City> _cities = [];
  UnmodifiableListView get cities => UnmodifiableListView(_cities);

  DBHelper myDatabase = DBHelper();

  // Method to get all cities from database
  Future<void> getAllCities() async {
    await myDatabase.hotelDatabase();
    _cities = await myDatabase.getAll('city') as List<City>;
    notifyListeners();
  }
}

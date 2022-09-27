import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/branch_model.dart';
import 'package:flutter/material.dart';

// Provider for all branches of the hotel
class BranchesProvider extends ChangeNotifier {
  List<Branch> _branches = [];
  UnmodifiableListView get branches => UnmodifiableListView(_branches);

  DBHelper myDatabase = DBHelper();

  // Method to get all branches from database
  Future<void> getAllModes() async {
    await myDatabase.hotelDatabase();
    _branches = await myDatabase.getAll('branch') as List<Branch>;
    notifyListeners();
  }
}

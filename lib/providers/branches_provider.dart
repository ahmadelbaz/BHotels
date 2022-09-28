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
  Future<void> getAllBranches() async {
    await myDatabase.hotelDatabase();
    _branches = await myDatabase.getAll('branch') as List<Branch>;
    notifyListeners();
  }

  // Method to return branch name using its id
  String getBranchName(int id) {
    var b = _branches.firstWhere((b) => b.id == id);
    return b.name;
  }
}

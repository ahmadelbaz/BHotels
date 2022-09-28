import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/category_model.dart';
import 'package:flutter/material.dart';

// Provider for all branches of the hotel
class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];
  UnmodifiableListView get categories => UnmodifiableListView(_categories);

  DBHelper myDatabase = DBHelper();

  // Method to get all categories from database
  Future<void> getAllCategories() async {
    await myDatabase.hotelDatabase();
    _categories = await myDatabase.getAll('category') as List<Category>;
    notifyListeners();
  }
}

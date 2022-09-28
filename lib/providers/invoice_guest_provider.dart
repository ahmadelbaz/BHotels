import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/invoice_guest_model.dart';
import 'package:flutter/material.dart';

class InvoiceGuestProvider extends ChangeNotifier {
  List<InvoiceGuest> _invoiceGuests = [];
  UnmodifiableListView get invoiceGuests =>
      UnmodifiableListView(_invoiceGuests);

  DBHelper myDatabase = DBHelper();

  // Insert new invoice guest into database
  Future<void> insertNewGuest(InvoiceGuest model) async {
    await myDatabase.hotelDatabase();
    _invoiceGuests.add(model);
    await myDatabase.insert(model);
    notifyListeners();
  }

  // Method to get all invoice guests from database
  Future<void> getAllInvoiceGuests() async {
    await myDatabase.hotelDatabase();
    _invoiceGuests =
        await myDatabase.getAll('invoice_guest') as List<InvoiceGuest>;
    notifyListeners();
  }
}

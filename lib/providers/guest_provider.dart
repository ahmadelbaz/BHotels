import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/guest_model.dart';
import 'package:flutter/material.dart';

class GuestProvider extends ChangeNotifier {
  // List<Guest> _guests = [];
  // UnmodifiableListView get guests => UnmodifiableListView(_guests);

  Guest _guest = Guest(
    id: 0,
    firstName: 'u1',
    lastName: 'l1',
    guestEmail: '',
    guestPhone: '01',
    address: 'a',
    details: 'd',
    hasPreviousBooking: false,
  );

  Guest get guest => _guest;

  DBHelper myDatabase = DBHelper();

  // Insert new guest into database
  Future<void> insertNewGuest(Guest model) async {
    await myDatabase.hotelDatabase();
    await myDatabase.clearTable('guest');
    _guest = model;
    await myDatabase.insert(model);
    notifyListeners();
  }

  // Method to get all guests from database
  Future<void> getAllGuests() async {
    await myDatabase.hotelDatabase();
    List<Guest> currentGuest = await myDatabase.getAll('guest') as List<Guest>;
    if (currentGuest.isNotEmpty) {
      _guest = currentGuest[0];
    }
    notifyListeners();
  }

  // Update guest first name
  Future<void> updateFirstName(String name) async {
    await myDatabase.hotelDatabase();
    _guest.firstName = name;
    await myDatabase.update(_guest);
    notifyListeners();
  }

  // Make user has previous booking (After finishes a reservation)
  Future<void> activatePreviousBooking() async {
    await myDatabase.hotelDatabase();
    _guest.hasPreviousBooking = true;
    await myDatabase.update(_guest);
    notifyListeners();
  }
}

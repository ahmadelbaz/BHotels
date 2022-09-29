import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/room_model.dart';
import 'package:flutter/material.dart';

class RoomProvider extends ChangeNotifier {
  // List of all available rooms
  List<Room> _rooms = [];
  UnmodifiableListView get rooms => UnmodifiableListView(_rooms);

  // Variable for how many persons should be in the room
  int _nOfPersons = 1;
  int get nOfPersons => _nOfPersons;

  // List of all abailable rooms in this branchaonly
  final List<Room> _branchRooms = [];
  List<Room> get branchRooms => _branchRooms;

  // List for selected rooms from the user to Book
  final List<Room> _selectedRooms = [];
  List<Room> get selectedRooms => _selectedRooms;

  // Variable to detect which branch that user selected
  int _userSelectedBranch = 0;
  int get userSelectedBranch => _userSelectedBranch;

  DBHelper myDatabase = DBHelper();

  // Insert new room into database
  Future<void> insertNewGuest(Room model) async {
    await myDatabase.hotelDatabase();
    _rooms.add(model);
    await myDatabase.insert(model);
    notifyListeners();
  }

  // Method to get all rooms from database
  Future<void> getAllRooms() async {
    await myDatabase.hotelDatabase();
    _rooms = await myDatabase.getAll('room') as List<Room>;
    notifyListeners();
  }

  updateUserSelectedBranch(int selected) {
    _userSelectedBranch = selected;
    _branchRooms.clear();
    for (Room room in _rooms) {
      if (room.branchIdRoom == selected) {
        _branchRooms.add(room);
      }
    }
    notifyListeners();
  }

  // Add room to  or remove it from the selected list to book it
  updateSeletedRooms(int id) {
    Room selectedRoom = _rooms.firstWhere((room) => room.id == id);
    if (!checkSelectedRoom(id) && selectedRoom.isAvailable) {
      _selectedRooms.add(selectedRoom);
    } else {
      _selectedRooms.removeWhere((room) => room.id == id);
    }
    notifyListeners();
  }

  // Check if this room is selected or not
  bool checkSelectedRoom(int id) {
    Room selectRoom = _rooms.firstWhere((room) => room.id == id);
    return _selectedRooms.contains(selectRoom);
  }

  // Calculate total price
  double calculateTotalPrice(bool hasDiscount) {
    double totalPrice = 0;
    for (Room room in selectedRooms) {
      if (hasDiscount) {
        totalPrice += room.currentPrice - room.currentPrice * 0.95;
      } else {
        totalPrice += room.currentPrice;
      }
    }
    return double.parse(totalPrice.toStringAsFixed(2));
  }

  // Check if there is double rooms or suites available
  bool checkForDouble() {
    bool moreThanOne = false;
    for (Room room in selectedRooms) {
      if (room.roomTypeIdRoom != 0) {
        moreThanOne = true;
      }
    }
    return moreThanOne;
  }

  // Increase no of person
  increaseNoOfPersons() {
    _nOfPersons += 1;
    notifyListeners();
  }

  // Decrease no of person
  decreaseNoOfPersons() {
    _nOfPersons -= 1;
    notifyListeners();
  }

  // Mark Room as booked
  Future<void> markroomAsBooked(int id) async {
    await myDatabase.hotelDatabase();
    Room n = _rooms.firstWhere((room) => room.id == id);
    int index = _rooms.indexOf(n);
    _rooms[index].isAvailable = false;
    await myDatabase.update(_rooms[index]);
    notifyListeners();
  }
}

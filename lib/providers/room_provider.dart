import 'dart:collection';

import 'package:bhotels/database/db_helper.dart';
import 'package:bhotels/models/room_model.dart';
import 'package:flutter/material.dart';

class RoomProvider extends ChangeNotifier {
  // List of all available rooms
  List<Room> _rooms = [];
  UnmodifiableListView get rooms => UnmodifiableListView(_rooms);

  // List of all abailable rooms in this branchaonly
  final List<Room> _branchRooms = [];
  UnmodifiableListView get branchRooms => UnmodifiableListView(_branchRooms);

  // List for selected rooms from the user to Book
  final List<Room> _selectedRooms = [];
  UnmodifiableListView get selectedRooms =>
      UnmodifiableListView(_selectedRooms);

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
  addToSeletedRooms(int id) {
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
}

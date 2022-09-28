import 'database_model.dart';

// Model for Branch
class Room implements DatabaseModel {
  int id = 0;
  String name = '';
  String roomDdescription = '';
  int branchIdRoom = 0;
  int roomTypeIdRoom = 0;
  double currentPrice = 0;
  bool isAvailable = false;

  Room({
    required this.id,
    required this.name,
    required this.roomDdescription,
    required this.branchIdRoom,
    required this.roomTypeIdRoom,
    required this.currentPrice,
    required this.isAvailable,
  });

// Handle the data that is coming from db
  Room.fromMap(Map<String, dynamic> map) {
    // Convert int to bool
    bool isRoomAvailable = map['is_available'] == 1 ? true : false;
    // Convert int to double
    double reaPrice = map['current_price'] / 100;
    id = map['room_id'];
    name = map['room_name'];
    roomDdescription = map['description'];
    branchIdRoom = map['branch_id'];
    roomTypeIdRoom = map['room_type_id'];
    currentPrice = reaPrice;
    isAvailable = isRoomAvailable;
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'room';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    // Convert bool to int
    int isRoomAvailable = isAvailable ? 1 : 0;
    // Convert double to int
    int realPrice = (currentPrice * 100).round();
    return {
      'room_id': id,
      'room_name': name,
      'description': roomDdescription,
      'branch_id': branchIdRoom,
      'room_type_id': roomTypeIdRoom,
      'current_price': realPrice,
      'is_available': isRoomAvailable,
    };
  }
}

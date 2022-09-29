import 'database_model.dart';

// Model for Branch
class RoomReserved implements DatabaseModel {
  int id = 0;
  int reservationIdRoomReserved = 0;
  int roomIdRoomReserved = 0;
  double price = 0;

  RoomReserved({
    required this.id,
    required this.reservationIdRoomReserved,
    required this.roomIdRoomReserved,
    required this.price,
  });

// Handle the data that is coming from db
  RoomReserved.fromMap(Map<String, dynamic> map) {
    // Convert int to double
    double realPrice = map['price'] / 100;
    id = map['id'];
    reservationIdRoomReserved = map['reservation_id'];
    roomIdRoomReserved = map['room_id'];
    price = realPrice;
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'room_reserved';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    // Convert double to int
    int realPrice = (price * 100).round();
    return {
      'id': id,
      'reservation_id': reservationIdRoomReserved,
      'room_id': roomIdRoomReserved,
      'price': realPrice,
    };
  }
}

import 'database_model.dart';

// Model for Room types (Singel, double .. etc)
class RoomType implements DatabaseModel {
  int id = 0;
  String name = '';

  RoomType({
    required this.id,
    required this.name,
  });

// Handle the data that is coming from db
  RoomType.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['type_name'];
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'room_type';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    return {
      'id': id,
      'type_name': name,
    };
  }
}

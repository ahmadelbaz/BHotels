import 'database_model.dart';

// Model for Branch
class ReservationStatusCatalog implements DatabaseModel {
  int id = 0;
  String name = '';

  ReservationStatusCatalog({
    required this.id,
    required this.name,
  });

// Handle the data that is coming from db
  ReservationStatusCatalog.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['status_name'];
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'reservation_status_catalog';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    return {
      'id': id,
      'status_name': name,
    };
  }
}

import 'database_model.dart';

// Model for Branch
class Guest implements DatabaseModel {
  int id = 0;
  String firstName = '';
  String lastName = '';
  String guestEmail = '';
  String guestPhone = '';
  String address = '';
  String details = '';
  bool hasPreviousBooking = false;

  Guest({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.guestEmail,
    required this.guestPhone,
    required this.address,
    required this.details,
    required this.hasPreviousBooking,
  });

// Handle the data that is coming from db
  Guest.fromMap(Map<String, dynamic> map) {
    // Convert int to bool
    bool hasPrevBook = map['has_previous_booking'] == 1 ? true : false;
    id = map['id'];
    firstName = map['first_name'];
    lastName = map['last_name'];
    guestEmail = map['guest_email'];
    guestPhone = map['guest_phone'];
    address = map['address'];
    details = map['details'];
    hasPreviousBooking = hasPrevBook;
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'guest';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    // Convert bool to int
    int hasPrevBook = hasPreviousBooking ? 1 : 0;
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'guest_email': guestEmail,
      'guest_phone': guestPhone,
      'address': address,
      'details': details,
      'has_previous_booking': hasPrevBook,
    };
  }
}

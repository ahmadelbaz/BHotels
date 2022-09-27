import 'database_model.dart';

// Model for Branch
class Reservation implements DatabaseModel {
  int id = 0;
  int guestIdReservation = 0;
  DateTime startDate = DateTime.now();
  DateTime endtDate = DateTime.now();
  DateTime tsCreatedReservation = DateTime.now();
  DateTime tsUpdatedReservation = DateTime.now();
  int discountPercent = 0;
  double totalPrice = 0;
  int reservationStatusCatalogId = 0;

  Reservation({
    required this.id,
    required this.guestIdReservation,
    required this.startDate,
    required this.endtDate,
    required this.tsCreatedReservation,
    required this.tsUpdatedReservation,
    required this.discountPercent,
    required this.totalPrice,
    required this.reservationStatusCatalogId,
  });

// Handle the data that is coming from db
  Reservation.fromMap(Map<String, dynamic> map) {
    // Convert int to double
    double realPrice = map['total_price'] / 100;
    // Convert int to dateTime
    DateTime realStartDate =
        DateTime.fromMillisecondsSinceEpoch(map['start_date']);
    DateTime realEndDate = DateTime.fromMillisecondsSinceEpoch(map['end_date']);
    DateTime tsCreatedDate =
        DateTime.fromMillisecondsSinceEpoch(map['ts_created_reservation']);
    DateTime tsUpdatedDate =
        DateTime.fromMillisecondsSinceEpoch(map['ts_updated']);
    // Assign variables to values from db
    id = map['reservation_id'];
    guestIdReservation = map['guest_id'];
    startDate = realStartDate;
    endtDate = realEndDate;
    tsCreatedReservation = tsCreatedDate;
    tsUpdatedReservation = tsUpdatedDate;
    discountPercent = map['discount_percent'];
    totalPrice = realPrice;
    reservationStatusCatalogId = map['reservation_status_catalog_id'];
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'reservation';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    // Convert double to int
    int storedPrice = (totalPrice * 100).round();
    // Convert dateTime to int
    int storedStartDate = startDate.millisecondsSinceEpoch;
    int storedEndDate = endtDate.millisecondsSinceEpoch;
    int storeTsCreatedDate = tsCreatedReservation.millisecondsSinceEpoch;
    int storeTsUpdatedDate = tsUpdatedReservation.millisecondsSinceEpoch;
    return {
      'reservation_id': id,
      'guest_id': guestIdReservation,
      'start_date': storedStartDate,
      'end_date': storedEndDate,
      'ts_created_reservation': storeTsCreatedDate,
      'ts_updated': storeTsUpdatedDate,
      'discount_percent': discountPercent,
      'total_price': storedPrice,
      'reservation_status_catalog_id': reservationStatusCatalogId,
    };
  }
}

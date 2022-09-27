import 'database_model.dart';

// Model for Branch
class InvoiceGuest implements DatabaseModel {
  int id = 0;
  int guestIdInvoice = 0;
  int reservationIdInvoice = 0;
  double invoiceAmount = 0;
  DateTime tsIssued = DateTime.now();
  DateTime tsPaid = DateTime.now();
  DateTime tsCanceled = DateTime.now();

  InvoiceGuest({
    required this.id,
    required this.guestIdInvoice,
    required this.reservationIdInvoice,
    required this.invoiceAmount,
    required this.tsIssued,
    required this.tsPaid,
    required this.tsCanceled,
  });

// Handle the data that is coming from db
  InvoiceGuest.fromMap(Map<String, dynamic> map) {
    // Convert int to double
    double realAmount = map['invoice_amount'] / 100;
    // Convert int to dateTime
    DateTime tsIssuedDate =
        DateTime.fromMillisecondsSinceEpoch(map['ts_issued']);
    DateTime tsPaidDate = DateTime.fromMillisecondsSinceEpoch(map['ts_paid']);
    DateTime tsCanceledDate =
        DateTime.fromMillisecondsSinceEpoch(map['ts_canceled']);
    // Assign variables to values from db
    id = map['guest_id'];
    guestIdInvoice = map['guest_id'];
    reservationIdInvoice = map['reservation_id'];
    invoiceAmount = realAmount;
    tsIssued = tsIssuedDate;
    tsPaid = tsPaidDate;
    tsCanceled = tsCanceledDate;
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'invoice_guest';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    // Convert double to int
    int storedAmount = (invoiceAmount * 100).round();
    // Convert dateTime to int
    int tsIssuedDate = tsIssued.millisecondsSinceEpoch;
    int tsPaidDate = tsPaid.millisecondsSinceEpoch;
    int tsCanceledDate = tsCanceled.millisecondsSinceEpoch;
    return {
      'invoice_guest_id': id,
      'guest_id': guestIdInvoice,
      'reservation_id': reservationIdInvoice,
      'invoice_amount': storedAmount,
      'ts_issued': tsIssuedDate,
      'ts_paid': tsPaidDate,
      'ts_canceled': tsCanceledDate,
    };
  }
}

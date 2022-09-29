import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../models/reservation_model.dart';
import '../models/room_model.dart';
import '../models/room_reserved_model.dart';

createNewReservation(
    BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch) {
  var roomsProvider = watch(roomChangeNotifierProvider);
  var guestProvider = watch(guestChangeNotifierProvider);
  var reservationProvider = watch(reservationChangeNotifierProvider);
  var roomReservedProvider = watch(roomReservedChangeNotifierProvider);
  // Create New Reservation
  Reservation newReservation = Reservation(
    id: DateTime.now().millisecondsSinceEpoch,
    guestIdReservation: guestProvider.guest.id,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    tsCreatedReservation: DateTime.now(),
    tsUpdatedReservation: DateTime.now(),
    discountPercent: guestProvider.guest.hasPreviousBooking ? 95 : 0,
    totalPrice: guestProvider.guest.hasPreviousBooking
        ? roomsProvider.calculateTotalPrice(true)
        : roomsProvider.calculateTotalPrice(false),
    numberOfPersons: roomsProvider.nOfPersons,
    reservationStatusCatalogId: 1,
  );
  // Insert New Reservation to provdier and DB
  reservationProvider.insertNewReservation(newReservation);
  // Add these rooms as reserved
  for (Room room in roomsProvider.selectedRooms) {
    // Mark room as booked
    roomsProvider.markroomAsBooked(room.id);
    roomReservedProvider.insertNewRoomReserved(
      RoomReserved(
        id: DateTime.now().millisecondsSinceEpoch,
        reservationIdRoomReserved: DateTime.now().millisecondsSinceEpoch,
        roomIdRoomReserved: room.id,
        price: guestProvider.guest.hasPreviousBooking
            ? double.parse((room.currentPrice - room.currentPrice * 0.95)
                .toStringAsFixed(2))
            : room.currentPrice,
      ),
    );
  }
  guestProvider.activatePreviousBooking();
  roomsProvider.selectedRooms.clear();
  roomsProvider.branchRooms.clear();
  Navigator.of(context)
      .pushNamedAndRemoveUntil('/home', ModalRoute.withName(''));
}

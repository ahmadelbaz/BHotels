import 'package:bhotels/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../widgets/custom_text.dart';

class ReservationsListScreen extends ConsumerWidget {
  const ReservationsListScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    // Instance of all providers we need
    var reservationProvider = watch(reservationChangeNotifierProvider);
    var reservationCatalogProvider =
        watch(reservationCatalogChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: const Text('All Reservations'),
      ),
      // We check if there is no previous reservations we show this message to the user instead (It could be better for sure)
      body: reservationProvider.reservations.isEmpty
          ? const Center(
              child: CustomText('New ? Book a room!', 24),
            )
          : ListView.builder(
              itemCount: reservationProvider.reservations.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: Text(
                    reservationCatalogProvider.getStatusCatalog(
                        reservationProvider
                            .reservations[index].reservationStatusCatalogId),
                  ),
                  title: Text(
                    'res ID : ${reservationProvider.reservations[index].id.toString()}',
                  ),
                  subtitle: Text(
                    'From : ${DateFormat("yy/MM/d").format(reservationProvider.reservations[index].startDate)} - To : ${DateFormat("yy/MM/d").format(reservationProvider.reservations[index].endDate)}',
                  ),
                  trailing: Text(
                    '${reservationProvider.reservations[index].totalPrice.toString()} \$',
                  ),
                );
              },
            ),
    );
  }
}

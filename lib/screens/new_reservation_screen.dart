import 'package:bhotels/functions/create_new_reservation.dart';
import 'package:bhotels/main.dart';
import 'package:bhotels/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../widgets/custom_text.dart';

class NewReservationScreen extends ConsumerWidget {
  const NewReservationScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    // Instance of all providers we need
    var roomsProvider = watch(roomChangeNotifierProvider);
    var roomTypeProvider = watch(roomTypeChangeNotifierProvider);
    var guestProvider = watch(guestChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: const Text('New Reservation'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: deviceSize.height * 0.02,
          ),
          const CustomText('Rooms Selected', 24),
          SizedBox(
            height: deviceSize.height * 0.02,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: roomsProvider.selectedRooms.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: Text(
                    '${roomsProvider.selectedRooms[index].currentPrice.toString()} \$'),
                title: Text(roomsProvider.selectedRooms[index].name),
                subtitle: Text(
                  roomTypeProvider.getRoomType(
                    roomsProvider.selectedRooms[index].roomTypeIdRoom,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    roomsProvider.updateSeletedRooms(
                      roomsProvider.selectedRooms[index].id,
                    );
                    if (roomsProvider.selectedRooms.isEmpty) {
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(Icons.close),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.1,
              vertical: deviceSize.height * 0.02,
            ),
            child: const Divider(
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              // TODO : We will make it changable by user
              CustomText('Start Date', 18),
              CustomText('25/10/2022', 14),
            ],
          ),
          SizedBox(
            height: deviceSize.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              // TODO : We will make it changable by user
              CustomText('End Date', 18),
              CustomText('30/10/2022', 14),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * 0.1,
                vertical: deviceSize.height * 0.02),
            child: const Divider(
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomText('Discount percent', 18),
              // We check if user has previous booking to give him 95% discount
              guestProvider.guest.hasPreviousBooking
                  ? const CustomText('95 %', 14)
                  : const CustomText('0 %', 14),
            ],
          ),
          SizedBox(
            height: deviceSize.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomText('Total price', 18),
              CustomText(
                '${guestProvider.guest.hasPreviousBooking ? roomsProvider.calculateTotalPrice(true).toString() : roomsProvider.calculateTotalPrice(false).toString()} \$',
                14,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.1,
              vertical: deviceSize.height * 0.02,
            ),
            child: const Divider(
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomText('No. of persons', 16),
              CustomText(roomsProvider.nOfPersons.toString(), 16),
              IconButton(
                onPressed: () {
                  // We check if reservation has only single rooms, so he cannot increase number of persons
                  if (roomsProvider.checkForDouble()) {
                    roomsProvider.increaseNoOfPersons();
                  } else {
                    customSnackBar('Reservation has only single rooms!');
                  }
                },
                icon: const Icon(Icons.arrow_circle_up),
              ),
              IconButton(
                onPressed: () {
                  // This check so that user cannot decrease number of persons under 1 person
                  if (roomsProvider.nOfPersons > 1) {
                    roomsProvider.decreaseNoOfPersons();
                  } else {
                    customSnackBar('What ? wanna leave the room ?!');
                  }
                },
                icon: const Icon(Icons.arrow_circle_down),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.2,
              vertical: deviceSize.height * 0.03,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(deviceSize.height * 0.07),
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                createNewReservation(context, watch);
              },
              child: CustomText(
                'Book',
                deviceSize.height * 0.02,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

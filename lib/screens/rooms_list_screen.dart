import 'package:bhotels/constants.dart';
import 'package:bhotels/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../providers/room_provider.dart';

class RoomsListScreen extends ConsumerWidget {
  const RoomsListScreen({super.key});

  Future<bool> _backMethod(RoomProvider roomProvider) async {
    roomProvider.selectedRooms.clear();
    return true;
  }

  @override
  Widget build(BuildContext context, watch) {
    // Instance of all providers we need
    var branchProvider = watch(branchChangeNotifierProvider);
    var roomProvider = watch(roomChangeNotifierProvider);
    var roomTypeProvider = watch(roomTypeChangeNotifierProvider);
    return WillPopScope(
      onWillPop: () {
        return _backMethod(roomProvider);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            branchProvider.getBranchName(roomProvider.userSelectedBranch),
          ),
          backgroundColor: primaryColor,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: roomProvider.selectedRooms.isEmpty
                  ? null
                  : () {
                      Navigator.of(context).pushNamed('/new_reservation');
                    },
              icon: const Icon(Icons.book),
            ),
          ],
        ),
        // We will use grid view to show the rooms in the hotel
        body: GridView.builder(
          itemCount: roomProvider.branchRooms.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                roomProvider
                    .updateSeletedRooms(roomProvider.branchRooms[index].id);
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      title:
                          CustomText(roomProvider.branchRooms[index].name, 22),
                      subtitle: CustomText(
                        roomProvider.branchRooms[index].roomDdescription,
                        12,
                        color: Colors.grey,
                      ),
                      trailing: roomProvider.branchRooms[index].isAvailable
                          ? Checkbox(
                              activeColor: primaryColor,
                              value: roomProvider.checkSelectedRoom(
                                  roomProvider.branchRooms[index].id),
                              onChanged: (value) {},
                            )
                          : const Icon(Icons.block),
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.02,
                    ),
                    CustomText(
                        roomTypeProvider.getRoomType(
                            roomProvider.branchRooms[index].roomTypeIdRoom),
                        16),
                    SizedBox(
                      height: deviceSize.height * 0.02,
                    ),
                    CustomText(
                      // We check room status (Available , Booked) and change its color depends on that
                      roomProvider.branchRooms[index].isAvailable
                          ? 'Available'
                          : 'Booked'.toString(),
                      16,
                      color: roomProvider.branchRooms[index].isAvailable
                          ? Colors.green
                          : Colors.red,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

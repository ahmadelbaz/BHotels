import 'package:bhotels/main.dart';
import 'package:bhotels/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    // Instance of all providers we need
    var branchProvider = watch(branchChangeNotifierProvider);
    var roomProvider = watch(roomChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: const Text('Select Branch'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/reservations_list');
              },
              icon: const Icon(Icons.file_open))
        ],
      ),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: branchProvider.branches.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * 0.1,
                vertical: deviceSize.height * 0.04,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(deviceSize.height * 0.1),
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // We detect which branch user Selected
                  roomProvider.updateUserSelectedBranch(index);
                  Navigator.of(context).pushNamed('/rooms_list');
                },
                child: CustomText(branchProvider.branches[index].name,
                    deviceSize.height * 0.035,
                    color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

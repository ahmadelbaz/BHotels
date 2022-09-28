import 'dart:developer';

import 'package:bhotels/main.dart';
import 'package:bhotels/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    var branchProvider = watch(branchChangeNotifierProvider);
    var guestProvider = watch(guestChangeNotifierProvider);
    var roomProvider = watch(roomChangeNotifierProvider);
    log('Count : ${roomProvider.rooms.length}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: const Text('Select Branch'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: branchProvider.branches.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceSize.width * 0.05,
                  vertical: deviceSize.height * 0.05),
              child: TextButton(
                onPressed: () {
                  roomProvider.updateUserSelectedBranch(index);
                  Navigator.of(context).pushNamed('/rooms_list');
                },
                child: CustomText(branchProvider.branches[index].name, 32),
              ),
            );
          },
        ),
      ),
    );
  }
}

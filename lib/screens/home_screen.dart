import 'dart:developer';

import 'package:bhotels/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    var branchProvider = watch(branchChangeNotifierProvider);
    var guestProvider = watch(guestChangeNotifierProvider);
    log('Count : ${branchProvider.branches.length}');
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: guestProvider.guests.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(guestProvider.guests[index].firstName),
              subtitle: Text(guestProvider.guests[index].lastName),
              trailing: Text(guestProvider.guests[index].id.toString()),
            );
          },
        ),
      ),
    );
  }
}

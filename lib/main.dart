import 'package:bhotels/constants.dart';
import 'package:bhotels/providers/branches_provider.dart';
import 'package:bhotels/providers/guest_provider.dart';
import 'package:bhotels/providers/reservation_catalog_provider.dart';
import 'package:bhotels/providers/reservation_provider.dart';
import 'package:bhotels/providers/room_provider.dart';
import 'package:bhotels/providers/room_reserved_provider.dart';
import 'package:bhotels/providers/room_type_provider.dart';
import 'package:bhotels/screens/home_screen.dart';
import 'package:bhotels/screens/new_reservation_screen.dart';
import 'package:bhotels/screens/reservations_list_screen.dart';
import 'package:bhotels/screens/rooms_list_screen.dart';
import 'package:bhotels/screens/signup_screen.dart';
import 'package:bhotels/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Global key so that we can get a context in any place we want
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Change notifier provider for GuestProvider
final guestChangeNotifierProvider =
    ChangeNotifierProvider<GuestProvider>((ref) => GuestProvider());
// Change notifier provider for BranchProvider
final branchChangeNotifierProvider =
    ChangeNotifierProvider<BranchesProvider>((ref) => BranchesProvider());
// Change notifier provider for RoomProvider
final roomChangeNotifierProvider =
    ChangeNotifierProvider<RoomProvider>((ref) => RoomProvider());
// Change notifier provider for RoomTypeProvider
final roomTypeChangeNotifierProvider =
    ChangeNotifierProvider<RoomTypeProvider>((ref) => RoomTypeProvider());
// Change notifier provider for ReservationProvider
final reservationChangeNotifierProvider =
    ChangeNotifierProvider<ReservationProvider>((ref) => ReservationProvider());
// Change notifier provider for RoomReservedProvider
final roomReservedChangeNotifierProvider =
    ChangeNotifierProvider<RoomReservedProvider>(
        (ref) => RoomReservedProvider());
// Change notifier provider for RoomReservedProvider
final reservationCatalogChangeNotifierProvider =
    ChangeNotifierProvider<ReservationCatalogProvider>(
        (ref) => ReservationCatalogProvider());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      builder: (context, child) {
        // Assign screen height and width to these global variables so we can use them in all screens
        deviceSize = MediaQuery.of(context).size;
        return Theme(
            data: ThemeData(
              fontFamily: 'Cairo',
            ),
            child: child!);
      },
      routes: {
        '/': (ctx) => WelcomeScreen(),
        '/home': (ctx) => const HomeScreen(),
        '/rooms_list': (ctx) => const RoomsListScreen(),
        '/new_reservation': (ctx) => const NewReservationScreen(),
        '/signup': (ctx) => SignupScreen(),
        '/reservations_list': (ctx) => const ReservationsListScreen(),
      },
    );
  }
}

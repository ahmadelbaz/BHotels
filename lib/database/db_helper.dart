import 'dart:developer';

import 'package:bhotels/database/db_consts.dart';
import 'package:bhotels/models/branch_model.dart';
import 'package:bhotels/models/category_model.dart';
import 'package:bhotels/models/city_model.dart';
import 'package:bhotels/models/country_model.dart';
import 'package:bhotels/models/guest_model.dart';
import 'package:bhotels/models/invoice_guest_model.dart';
import 'package:bhotels/models/reservation_model.dart';
import 'package:bhotels/models/reservation_status_catalog_model.dart';
import 'package:bhotels/models/room_model.dart';
import 'package:bhotels/models/room_reserved_model.dart';
import 'package:bhotels/models/room_type_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/database_model.dart';

class DBHelper extends ChangeNotifier {
  // HCountries & cities Subject Area
  static const country = 'country';

  static const countryId = 'country_id';
  static const countryName = 'country_name';

  static const city = 'city';

  static const cityId = 'city_id';
  static const cityName = 'city_name';
  static const postalCode = 'postal_code';
  static const countryIdCity = countryId;

  // Hotel Subject Area
  static const category = 'category';

  static const categoryId = 'category_id';
  static const categoryName = 'category_name';

  static const branch = 'branch';

  static const branchId = 'branch_id';
  static const branchName = 'branch_name';
  static const description = 'branch_description';
  static const branchEmail = 'branch_email';
  static const branchPhone = 'branch_phone';
  static const cityIdBranch = cityId;
  static const branchAddress = 'branch_address';
  static const categoryIdBranch = categoryId;
  static const isAcive = 'is_active';

  static const room = 'room';

  static const roomId = 'room_id';
  static const roomName = 'room_name';
  static const roomDdescription = 'description';
  static const branchIdRoom = branchId;
  static const roomTypeIdRoom = roomTypeId;
  static const currentPrice = 'current_price';
  static const isAvailable = 'is_available';

  static const roomType = 'room_type';

  static const roomTypeId = 'room_type_id';
  static const typeName = 'type_name';

// Reservations Subject Area
  static const reservation = 'reservation';

  static const reservationId = 'reservation_id';
  static const guestIdReservation = guestId;
  static const startDate = 'start_date';
  static const endtDate = 'end_date';
  static const tsCreatedReservation = 'ts_created_reservation';
  static const tsUpdatedReservation = 'ts_updated';
  static const discountPercent = 'discount_percent';
  static const totalPrice = 'total_price';
  static const reservationStatusCatalodIdReservation =
      reservationStatusCatalogId;

  static const roomReserved = 'room_reserved';

  static const roomReservedId = 'room_reserved_id';
  static const reservationIdRoomReserved = reservationId;
  static const roomIdRoomReserved = roomId;
  static const price = 'price';

  static const reservationStatusCatalog = 'reservation_status_catalog';

  static const reservationStatusCatalogId = 'reservation_status_catalog_id';
  static const statusName = 'status_name';

// Guests Subject Area
  static const guest = 'guest';

  static const guestId = 'guest_id';
  static const firstName = 'first_name';
  static const lastName = 'last_name';
  static const guestEmail = 'guest_email';
  static const guestPhone = 'guest_phone';
  static const address = 'address';
  static const details = 'details';
  static const hasPreviousBooking = 'has_previous_booking';

  static const invoiceGuest = 'invoice_guest';

  static const invoiceGuestId = 'invoice_guest_id';
  static const guestIdInvoice = guestId;
  static const reservationIdInvoice = reservationId;
  static const invoiceAmount = 'invoice_amount';
  static const tsIssued = 'ts_issued';
  static const tsPaid = 'ts_paid';
  static const tsCanceled = 'ts_canceled';

  Future<Database> hotelDatabase() async {
    // Method for version 1 of the database
    void createTablesV1(Batch batch) {
      // Deleting the table, and any data associated with it, from the database if it exists.
      // Country Table and its data
      batch.execute('DROP TABLE IF EXISTS $country');
      batch.execute('''CREATE TABLE $country (
      $countryId INTEGER PRIMARY KEY AUTOINCREMENT, $countryName TEXT
      )''');
      // City Table and its data
      batch.execute('DROP TABLE IF EXISTS $city');
      batch.execute('''CREATE TABLE $city (
          $cityId INTEGER PRIMARY KEY AUTOINCREMENT, $cityName TEXT, $postalCode TEXT, $countryIdCity INTEGER
      )''');
      // Category Table and its data
      batch.execute('DROP TABLE IF EXISTS $category');
      batch.execute('''CREATE TABLE $category (
          $categoryId INTEGER PRIMARY KEY AUTOINCREMENT, $categoryName TEXT
      )''');
      // Branch Table and its data
      batch.execute('DROP TABLE IF EXISTS $branch');
      batch.execute('''CREATE TABLE $branch (
          $branchId INTEGER PRIMARY KEY AUTOINCREMENT, $branchName TEXT, $description TEXT, $branchEmail TEXT, $branchPhone TEXT, $cityIdBranch INTEGER, $branchAddress TEXT, $categoryIdBranch INTEGER, $isAcive INTEGER
      )''');
      // Room Table and its data
      batch.execute('DROP TABLE IF EXISTS $room');
      batch.execute('''CREATE TABLE $room (
          $roomId INTEGER PRIMARY KEY AUTOINCREMENT, $roomName TEXT, $roomDdescription TEXT, $branchIdRoom INTEGER, $roomTypeIdRoom INTEGER, $currentPrice INTEGER, $isAvailable INTEGER
      )''');
      // Room Type Table and its data
      batch.execute('DROP TABLE IF EXISTS $roomType');
      batch.execute('''CREATE TABLE $roomType (
          $roomTypeId INTEGER PRIMARY KEY AUTOINCREMENT, $typeName TEXT
      )''');
      // Reservation Table and its data
      batch.execute('DROP TABLE IF EXISTS $reservation');
      batch.execute('''CREATE TABLE $reservation (
          $reservationId INTEGER PRIMARY KEY AUTOINCREMENT, $guestIdReservation INTEGER, $startDate INTEGER, $endtDate INTEGER, $tsCreatedReservation INTEGER, $tsUpdatedReservation INTEGER, $discountPercent INTEGER, $totalPrice INTEGER, $reservationStatusCatalodIdReservation INTEGER
      )''');
      // Room Reserved Type Table and its data
      batch.execute('DROP TABLE IF EXISTS $roomReserved');
      batch.execute('''CREATE TABLE $roomReserved (
          $roomReservedId INTEGER PRIMARY KEY AUTOINCREMENT, $reservationIdRoomReserved INTEGER, $roomIdRoomReserved, INTEGER, $price INTEGER
      )''');
      // Reservation Status Catalog Table and its data
      batch.execute('DROP TABLE IF EXISTS $reservationStatusCatalog');
      batch.execute('''CREATE TABLE $reservationStatusCatalog (
          $reservationStatusCatalogId INTEGER PRIMARY KEY AUTOINCREMENT, $statusName TEXT
      )''');
      // Guest Table and its data
      batch.execute('DROP TABLE IF EXISTS $guest');
      batch.execute('''CREATE TABLE $guest (
          $guestId INTEGER PRIMARY KEY AUTOINCREMENT, $firstName TEXT, $lastName TEXT, $guestEmail TEXT, $guestPhone TEXT, $address TEXT, $details TEXT, $hasPreviousBooking INTEGER
      )''');
      // Invoice Guest Table and its data
      batch.execute('DROP TABLE IF EXISTS $invoiceGuest');
      batch.execute('''CREATE TABLE $invoiceGuest (
          $invoiceGuestId INTEGER PRIMARY KEY AUTOINCREMENT, $guestIdInvoice INTEGER, $reservationIdInvoice INTEGER, $invoiceAmount INTEGER, $tsIssued INTEGER, $tsPaid INTEGER, $tsCanceled INTEGER
      )''');
      // Adding default data to tables in DB
      for (Country n in defaultCountreis) {
        batch.insert('country', n.toMap()!,
            conflictAlgorithm: ConflictAlgorithm.replace);
        log('defaultCountreis no. = ${defaultCountreis.length}');
      }
      for (City n in defaultCities) {
        batch.insert('city', n.toMap()!,
            conflictAlgorithm: ConflictAlgorithm.replace);
        log('defaultCities no. = ${defaultCities.length}');
      }
      for (Category n in defaultCategories) {
        batch.insert('category', n.toMap()!,
            conflictAlgorithm: ConflictAlgorithm.replace);
        log('defaultCategories no. = ${defaultCategories.length}');
      }
      for (Branch n in defaultBranches) {
        batch.insert('branch', n.toMap()!,
            conflictAlgorithm: ConflictAlgorithm.replace);
        log('branches no. = ${defaultBranches.length}');
      }
      for (RoomType n in defaultRoomTypes) {
        batch.insert('room_type', n.toMap()!,
            conflictAlgorithm: ConflictAlgorithm.replace);
        log('defaultRoomTypes no. = ${defaultRoomTypes.length}');
      }
      for (Room n in defaultRooms) {
        batch.insert('room', n.toMap()!,
            conflictAlgorithm: ConflictAlgorithm.replace);
        log('defaultRooms no. = ${defaultRooms.length}');
      }
      for (ReservationStatusCatalog n in defaultReservationCatalogs) {
        batch.insert('reservation_status_catalog', n.toMap()!,
            conflictAlgorithm: ConflictAlgorithm.replace);
        log('defaultReservationCatalogs no. = ${defaultReservationCatalogs.length}');
      }
    }

    // First version of the database
    return openDatabase(
      join(await getDatabasesPath(), 'hoteldb.db'),
      version: 1,
      onCreate: (db, version) async {
        var batch = db.batch();
        createTablesV1(batch);
        await batch.commit();
      },
      onDowngrade: onDatabaseDowngradeDelete,
      onConfigure: _onConfigure,
    );
  }

  // OnConfigure method to help us in Foreign keys
  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

// Insert in DB method using table name & the data itself
  Future<void> insert(DatabaseModel model) async {
    final db = await hotelDatabase();
    db.insert(
      model.table()!,
      model.toMap()!,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update data in DB method using table name, the new data & id
  Future<void> update(DatabaseModel model) async {
    final db = await hotelDatabase();
    db.update(
      model.table()!,
      model.toMap()!,
      where: 'id = ?',
      whereArgs: [model.getId()],
    );
    notifyListeners();
  }

  // Delete data from DB method using table name & id
  Future<void> delete(DatabaseModel model) async {
    final db = await hotelDatabase();
    db.delete(
      model.table()!,
      where: 'id = ?',
      whereArgs: [model.getId()],
    );
  }

  // Method to get data from database to use it in the app
  Future<List<DatabaseModel>> getAll(String table) async {
    // Instance of db to use
    final db = await hotelDatabase();
    // Get all we have in db
    final List<Map<String, dynamic>> maps = await db.query(table);
    // Create lists to fill the data in and return with what we want
    List<Branch> branches = [];
    List<Category> categories = [];
    List<City> cities = [];
    List<Country> countries = [];
    List<Guest> guests = [];
    List<InvoiceGuest> invoices = [];
    List<Reservation> reservations = [];
    List<ReservationStatusCatalog> resStatusCatalogs = [];
    List<Room> rooms = [];
    List<RoomReserved> roomsReserved = [];
    List<RoomType> roomsTypes = [];
    for (var item in maps) {
      switch (table) {
        case 'branch':
          branches.add(Branch.fromMap(item));
          break;
        case 'category':
          categories.add(Category.fromMap(item));
          break;
        case 'city':
          cities.add(City.fromMap(item));
          break;
        case 'country':
          countries.add(Country.fromMap(item));
          break;
        case 'guest':
          guests.add(Guest.fromMap(item));
          break;
        case 'invoice_guest':
          invoices.add(InvoiceGuest.fromMap(item));
          break;
        case 'reservation':
          reservations.add(Reservation.fromMap(item));
          break;
        case 'reservation_status_catalog':
          resStatusCatalogs.add(ReservationStatusCatalog.fromMap(item));
          break;
        case 'room':
          rooms.add(Room.fromMap(item));
          break;
        case 'room_reserved':
          roomsReserved.add(RoomReserved.fromMap(item));
          break;
        case 'room_type':
          roomsTypes.add(RoomType.fromMap(item));
          break;
      }
    }
    return table == 'branch'
        ? branches
        : table == 'category'
            ? categories
            : table == 'city'
                ? cities
                : table == 'country'
                    ? countries
                    : table == 'guest'
                        ? guests
                        : table == 'invoice_guest'
                            ? invoices
                            : table == 'reservation'
                                ? reservations
                                : table == 'reservation_status_catalog'
                                    ? resStatusCatalogs
                                    : table == 'room'
                                        ? rooms
                                        : table == 'room_reserved'
                                            ? roomsReserved
                                            : roomsTypes;
  }
}

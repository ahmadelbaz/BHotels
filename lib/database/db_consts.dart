// Add default values for db tables
// This is all Dummy data
import 'package:bhotels/models/branch_model.dart';
import 'package:bhotels/models/category_model.dart';
import 'package:bhotels/models/city_model.dart';
import 'package:bhotels/models/country_model.dart';
import 'package:bhotels/models/reservation_status_catalog_model.dart';
import 'package:bhotels/models/room_type_model.dart';

import '../models/room_model.dart';

List<Country> defaultCountreis = [
  Country(id: 0, name: 'Egypt'),
  Country(id: 1, name: 'Kuwait'),
  Country(id: 2, name: 'UAE'),
];

List<City> defaultCities = [
  City(id: 0, name: 'Cairo', postalCode: '22122', countryIdCity: 0),
  City(id: 1, name: 'Kuwait', postalCode: '41523', countryIdCity: 1),
  City(id: 2, name: 'Dubai', postalCode: '96325', countryIdCity: 2),
];

List<Category> defaultCategories = [
  Category(id: 0, name: 'Chain Hotel'),
  Category(id: 1, name: 'Motel'),
  Category(id: 2, name: 'Resort'),
  Category(id: 3, name: 'Inn'),
  Category(id: 4, name: 'All-suites'),
];

List<Branch> defaultBranches = [
  Branch(
    id: 0,
    name: 'Cairo Branch',
    description: 'Our new branch',
    branchEmail: 'cairo_branch@bhotels.com',
    branchPhone: '+20112345689',
    cityIdBranch: 0,
    branchAddress: '16 second street Hileopoles',
    categoryIdBranch: 3,
    isAcive: true,
  ),
  Branch(
    id: 1,
    name: 'Kuwait Branch',
    description: 'Our modern branch at Kuwait',
    branchEmail: 'kuwait_branch@bhotels.com',
    branchPhone: '+965333333',
    cityIdBranch: 1,
    branchAddress: '22 kuwait street',
    categoryIdBranch: 4,
    isAcive: false,
  ),
  Branch(
    id: 2,
    name: 'Dubai Branch',
    description: 'Our Best original branch',
    branchEmail: 'dubai_branch@bhotels.com',
    branchPhone: '+9712345689',
    cityIdBranch: 2,
    branchAddress: '8 dubai street',
    categoryIdBranch: 0,
    isAcive: true,
  )
];

List<RoomType> defaultRoomTypes = [
  RoomType(id: 0, name: 'Single Room'),
  RoomType(id: 1, name: 'Double Room'),
  RoomType(id: 2, name: 'Twin Room'),
  RoomType(id: 3, name: 'Studio Room'),
  RoomType(id: 4, name: 'Deluxe Room'),
  RoomType(id: 5, name: 'Suite'),
  RoomType(id: 6, name: 'Presidential Suite'),
];

List<Room> defaultRooms = [
  Room(
    id: 0,
    name: 'Room 1',
    roomDdescription: 'first room',
    branchIdRoom: 0,
    roomTypeIdRoom: 0,
    currentPrice: 125,
    isAvailable: true,
  ),
  Room(
    id: 1,
    name: 'Room 2',
    roomDdescription: 'Second room',
    branchIdRoom: 0,
    roomTypeIdRoom: 1,
    currentPrice: 117,
    isAvailable: false,
  ),
  Room(
    id: 2,
    name: 'Room 3',
    roomDdescription: 'Third room',
    branchIdRoom: 0,
    roomTypeIdRoom: 0,
    currentPrice: 125,
    isAvailable: true,
  ),
  Room(
    id: 3,
    name: 'Room 4',
    roomDdescription: 'Fourth room',
    branchIdRoom: 0,
    roomTypeIdRoom: 5,
    currentPrice: 117,
    isAvailable: true,
  ),
  Room(
    id: 4,
    name: 'Room 1',
    roomDdescription: 'First room',
    branchIdRoom: 1,
    roomTypeIdRoom: 0,
    currentPrice: 125,
    isAvailable: true,
  ),
  Room(
    id: 5,
    name: 'Room 2',
    roomDdescription: 'Second room',
    branchIdRoom: 1,
    roomTypeIdRoom: 1,
    currentPrice: 125,
    isAvailable: true,
  ),
  Room(
    id: 6,
    name: 'Room 3',
    roomDdescription: 'Third room',
    branchIdRoom: 1,
    roomTypeIdRoom: 0,
    currentPrice: 125,
    isAvailable: false,
  ),
  Room(
    id: 7,
    name: 'Room 4',
    roomDdescription: 'Fourth room',
    branchIdRoom: 1,
    roomTypeIdRoom: 5,
    currentPrice: 117,
    isAvailable: true,
  ),
  Room(
    id: 8,
    name: 'Room 5',
    roomDdescription: 'Fifth room',
    branchIdRoom: 1,
    roomTypeIdRoom: 1,
    currentPrice: 125,
    isAvailable: true,
  ),
  Room(
    id: 9,
    name: 'Room 6',
    roomDdescription: 'Sixth room',
    branchIdRoom: 1,
    roomTypeIdRoom: 0,
    currentPrice: 117,
    isAvailable: false,
  ),
  Room(
    id: 10,
    name: 'Room 1',
    roomDdescription: 'first room',
    branchIdRoom: 2,
    roomTypeIdRoom: 1,
    currentPrice: 125,
    isAvailable: true,
  ),
  Room(
    id: 11,
    name: 'Room 2',
    roomDdescription: 'Second room',
    branchIdRoom: 2,
    roomTypeIdRoom: 0,
    currentPrice: 117,
    isAvailable: true,
  ),
  Room(
    id: 12,
    name: 'Room 3',
    roomDdescription: 'Third room',
    branchIdRoom: 2,
    roomTypeIdRoom: 1,
    currentPrice: 188,
    isAvailable: true,
  ),
  Room(
    id: 13,
    name: 'Room 4',
    roomDdescription: 'Fourth room',
    branchIdRoom: 2,
    roomTypeIdRoom: 5,
    currentPrice: 220,
    isAvailable: false,
  ),
  Room(
    id: 14,
    name: 'Room 5',
    roomDdescription: 'Fifth room',
    branchIdRoom: 2,
    roomTypeIdRoom: 5,
    currentPrice: 220,
    isAvailable: false,
  ),
];

List<ReservationStatusCatalog> defaultReservationCatalogs = [
  ReservationStatusCatalog(
    id: 0,
    name: 'Confirmed',
  ),
  ReservationStatusCatalog(
    id: 1,
    name: 'Tentative',
  ),
  ReservationStatusCatalog(
    id: 2,
    name: 'Waitlist',
  ),
  ReservationStatusCatalog(
    id: 3,
    name: 'Cancelled',
  ),
];

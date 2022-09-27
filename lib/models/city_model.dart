import 'database_model.dart';

// Model for Branch
class City implements DatabaseModel {
  int id = 0;
  String name = '';
  String postalCode = '';
  int countryIdCity = 0;

  City({
    required this.id,
    required this.name,
    required this.postalCode,
    required this.countryIdCity,
  });

// Handle the data that is coming from db
  City.fromMap(Map<String, dynamic> map) {
    id = map['city_id'];
    name = map['city_name'];
    postalCode = map['postal_code'];
    countryIdCity = map['country_id'];
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'city';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    return {
      'city_id': id,
      'city_name': name,
      'postal_code': postalCode,
      'country_id': countryIdCity,
    };
  }
}

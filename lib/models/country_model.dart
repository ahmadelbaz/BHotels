import 'database_model.dart';

// Model for Branch
class Country implements DatabaseModel {
  int id = 0;
  String name = '';

  Country({
    required this.id,
    required this.name,
  });

// Handle the data that is coming from db
  Country.fromMap(Map<String, dynamic> map) {
    id = map['country_id'];
    name = map['country_name'];
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'country';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    return {
      'country_id': id,
      'country_name': name,
    };
  }
}

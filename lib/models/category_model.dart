import 'database_model.dart';

// Model for Branch
class Category implements DatabaseModel {
  int id = 0;
  String name = '';

  Category({
    required this.id,
    required this.name,
  });

// Handle the data that is coming from db
  Category.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['category_name'];
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'category';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    return {
      'id': id,
      'category_name': name,
    };
  }
}

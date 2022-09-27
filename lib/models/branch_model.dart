import 'database_model.dart';

// Model for Branch
class Branch implements DatabaseModel {
  int id = 0;
  String name = '';
  String description = '';
  String branchEmail = '';
  String branchPhone = '';
  int cityIdBranch = 0;
  String branchAddress = '';
  int categoryIdBranch = 0;
  bool isAcive = true;

  Branch({
    required this.id,
    required this.name,
    required this.description,
    required this.branchEmail,
    required this.branchPhone,
    required this.cityIdBranch,
    required this.branchAddress,
    required this.categoryIdBranch,
    required this.isAcive,
  });

// Handle the data that is coming from db
  Branch.fromMap(Map<String, dynamic> map) {
    // Convert int to bool
    bool roomStatus = map['is_active'] == 1 ? true : false;
    id = map['branch_id'];
    name = map['branch_name'];
    description = map['branch_description'];
    branchEmail = map['branch_email'];
    branchPhone = map['branch_phone'];
    cityIdBranch = map['city_id'];
    branchAddress = map['branch_address'];
    categoryIdBranch = map['category_id'];
    isAcive = roomStatus;
  }

  @override
  int? getId() {
    return id;
  }

  @override
  String? table() {
    return 'branch';
  }

  // Handle the data before storing it in db
  @override
  Map<String, dynamic>? toMap() {
    // Convert bool to int
    int roomStatus = isAcive ? 1 : 0;
    return {
      'branch_id': id,
      'branch_name': name,
      'branch_description': description,
      'branch_email': branchEmail,
      'branch_phone': branchPhone,
      'city_id': cityIdBranch,
      'branch_address': branchAddress,
      'category_id': categoryIdBranch,
      'is_active': roomStatus,
    };
  }
}

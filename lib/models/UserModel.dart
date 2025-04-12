class UserModel {
  final String role;
  final String name;
  final String dob;
  final String address;
  final String gender;
  final String email;
  final String password;
  final String password_confirmation;

  UserModel({
    required this.role,
    required this.name,
    required this.dob,
    required this.address,
    required this.gender,
    required this.email,
    required this.password,
    required this.password_confirmation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        role: json['role'],
        name: json['name'],
        dob: json['dob'],
        address: json['address'],
        gender: json['gender'],
        email: json['email'],
        password: json['password'],
        password_confirmation: json['password_confirmation'],
      );

  Map<String, dynamic> toJson() => {
        'role': role,
        'name': name,
        'dob': dob,
        'address': address,
        'gender': gender,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
      };
}

class User {
  User({
    required this.name,
    required this.email,
    required this.roles,
    this.createdAt,
    this.updatedAt,
  });

  final String name;
  final String email;
  final List<String> roles;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      roles: List<String>.from(json['roles']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

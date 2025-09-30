class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String? avatar;
  final String? biography;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.avatar,
    this.biography,
    required this.createdAt,
    required this.updatedAt
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    username: json['username'],
    email: json['email'],
    avatar: json['avatar'],
    biography: json['biography'],
    createdAt: DateTime.parse(json['created_at']),
    updatedAt: DateTime.parse(json['updated_at'])
  );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'avatar': avatar,
      'biography': biography,
      'password': null
    };
  }

  User copyWith({
    String? name,
    String? username,
    String? email,
    String? avatar,
    String? biography
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      biography: biography ?? this.biography,
      createdAt: createdAt,
      updatedAt: updatedAt
    );
  }
}
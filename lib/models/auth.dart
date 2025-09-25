class AuthRequest {
  final String? name;
  final String? username;
  final String email;
  final String password;

  AuthRequest({
    this.name,
    this.username,
    required this.email,
    required this.password
  });

  Map<String, dynamic> toJsonLogin() {
    return {
      'email': email,
      'password': password
    };
  }

  Map<String, dynamic> toJsonRegister() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'password': password
    };
  }
}
class User {
  final int id;
  final String username;
  final String email;
  final String? type;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.type,
  });
}

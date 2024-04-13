class UserModel {
  String id;
  String name;
  String email;
  String? photoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });
}

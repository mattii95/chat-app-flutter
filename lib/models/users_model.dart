class UsersModel {
  bool online;
  String email;
  String nombre;
  String uid;
  String? photo;

  UsersModel({
    required this.online,
    required this.email,
    required this.nombre,
    required this.uid,
    this.photo,
  });
}

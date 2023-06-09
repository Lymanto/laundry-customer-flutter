class UserModel {
  late String idUser;
  late String fullName;
  late String noHP;
  late String userPhoto;
  late String token;

  UserModel({
    required this.idUser,
    required this.fullName,
    required this.noHP,
    required this.userPhoto,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    fullName = json['full_name'];
    noHP = json['no_hp'].toString();
    userPhoto = json['user_photo'];
    token = json['access_token_bearer'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'full_name': fullName,
      'no_hp': noHP,
      'user_photo': userPhoto,
      'access_token_bearer': token,
    };
  }
}

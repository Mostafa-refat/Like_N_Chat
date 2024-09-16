class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? imageProfile;
  String? imageCover;
  String? bio;
  bool? isEmailVerified;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.imageProfile,
    this.imageCover,
    this.bio,
    this.isEmailVerified,
  });
//============================================================>
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    imageProfile = json['imageProfile'];
    imageCover = json['imageCover'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }
//============================================================>
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'imageProfile': imageProfile,
      'imageCover': imageCover,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
//============================================================>
}

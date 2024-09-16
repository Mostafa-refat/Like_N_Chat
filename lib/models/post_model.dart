class PostModel {
  String? name;
  String? uId;
  String? imageProfile;
  String? dateTime;
  String? text;
  String? postImage;

  PostModel({
    this.name,
    this.uId,
    this.imageProfile,
    this.dateTime,
    this.text,
    this.postImage,
  });
//============================================================>
  PostModel.fromJon(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    imageProfile = json['imageProfile'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
  }
//============================================================>
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'imageProfile': imageProfile,
      'dateTime': dateTime,
      'text': text,
      'postImage': postImage,
    };
  }
//============================================================>
}

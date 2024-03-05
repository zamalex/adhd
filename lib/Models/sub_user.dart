class SubUsersResponse {
  int? statusCode;
  bool? succeeded;
  String? message;
  List<SubUser>? subUsers;

  SubUsersResponse(
      {this.statusCode, this.succeeded, this.message, this.subUsers});

  SubUsersResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    if (json['data'] != null) {
      subUsers = <SubUser>[];
      json['data'].forEach((v) {
        subUsers!.add(new SubUser.fromJson(v));
      });
    }
  }


}

class SubUser {
  String? id;
  String? firstName;
  String? lastName;
  String? birthPlace;
  String? religion;
  String? gender;
  String? birthDate;
  String? creationTime;
  String? email;
  String? image;

  SubUser(
      {this.id,
        this.firstName,
        this.lastName,
        this.birthPlace,
        this.religion,
        this.gender,
        this.birthDate,
        this.creationTime,
        this.email,
        this.image});

  SubUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthPlace = json['birthPlace'];
    religion = json['religion'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    creationTime = json['creationTime'];
    email = json['email'];
    image = json['image'];
  }

}
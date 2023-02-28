class UserModel {
  String? token;
  bool? success ;

  UserModel({this.token , this.success});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.token = json['authtoken'];
    this.success = json['success'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authtoken'] = this.token;
    data['success'] = this.success;
    return data;
  }
}

class GetUserModel {
  String? sId;
  String? name;
  String? email;
  String? image;
  int? iV;

  GetUserModel({this.sId, this.name, this.email, this.image, this.iV});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}


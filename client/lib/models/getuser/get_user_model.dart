class GetUserModel {
  String? sId;
  String? name;
  String? email;
  String? date;
  int? iV;

  GetUserModel({this.sId, this.name, this.email, this.date, this.iV});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}


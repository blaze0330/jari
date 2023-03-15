class GetAllUserModel {
  int? completedTasks;
  String? sId;
  String? name;
  String? password;
  String? email;
  String? image;
  int? iV;

  GetAllUserModel(
      {this.completedTasks,
      this.sId,
      this.name,
      this.password,
      this.email,
      this.image,
      this.iV});

  GetAllUserModel.fromJson(Map<String, dynamic> json) {
    completedTasks = json['completedTasks'];
    sId = json['_id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completedTasks'] = this.completedTasks;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}

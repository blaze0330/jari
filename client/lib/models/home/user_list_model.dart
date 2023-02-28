class Task {
  String? sId;
  String? user;
  String? title;
  int? totalCount;
  int? completedCount;
  int? animationType;
  int? iV;

  Task(
      {this.sId,
      this.user,
      this.title,
      this.totalCount,
      this.completedCount,
      this.animationType,
      this.iV});

  Task.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    title = json['title'];
    totalCount = json['totalCount'];
    completedCount = json['completedCount'];
    animationType = json['animationType'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['title'] = this.title;
    data['totalCount'] = this.totalCount;
    data['completedCount'] = this.completedCount;
    data['animationType'] = this.animationType;
    data['__v'] = this.iV;
    return data;
  }
}

class HomeNewsListModelEntity {
  int? id;
  String? title;
  String? time;
  String? image;

  HomeNewsListModelEntity({this.id, this.title, this.time, this.image});

  HomeNewsListModelEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    time = json['time'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['time'] = this.time;
    data['image'] = this.image;
    return data;
  }
}
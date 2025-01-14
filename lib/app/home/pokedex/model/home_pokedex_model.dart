class HomePokedexModel {
  int? id;
  String? name;
  List<String>? habits;
  List<String>? bgColor;
  String? image;

  HomePokedexModel({this.id, this.name, this.habits, this.bgColor, this.image});

  HomePokedexModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    habits = json['habits'].cast<String>();
    bgColor = json['bgColor'].cast<String>();
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['habits'] = this.habits;
    data['bgColor'] = this.bgColor;
    data['image'] = this.image;
    return data;
  }
}
  

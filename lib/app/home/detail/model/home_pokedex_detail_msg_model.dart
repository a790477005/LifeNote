class HomePokedexDetailMsgModel {
  String? introduce;
  Body? body;
  Breed? breed;

  HomePokedexDetailMsgModel({this.introduce, this.body, this.breed});

  HomePokedexDetailMsgModel.fromJson(Map<String, dynamic> json) {
    introduce = json['introduce'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    breed = json['breed'] != null ? new Breed.fromJson(json['breed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['introduce'] = this.introduce;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    if (this.breed != null) {
      data['breed'] = this.breed!.toJson();
    }
    return data;
  }
}

class Body {
  String? height;
  String? weight;

  Body({this.height, this.weight});

  Body.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['weight'] = this.weight;
    return data;
  }
}

class Breed {
  Gender? gender;
  String? eggGroup;
  String? eggCycle;

  Breed({this.gender, this.eggGroup, this.eggCycle});

  Breed.fromJson(Map<String, dynamic> json) {
    gender =
        json['gender'] != null ? new Gender.fromJson(json['gender']) : null;
    eggGroup = json['eggGroup'];
    eggCycle = json['eggCycle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gender != null) {
      data['gender'] = this.gender!.toJson();
    }
    data['eggGroup'] = this.eggGroup;
    data['eggCycle'] = this.eggCycle;
    return data;
  }
}

class Gender {
  String? male;
  String? female;

  Gender({this.male, this.female});

  Gender.fromJson(Map<String, dynamic> json) {
    male = json['male'];
    female = json['female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['male'] = this.male;
    data['female'] = this.female;
    return data;
  }
}

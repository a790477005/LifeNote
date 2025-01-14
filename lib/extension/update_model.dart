
class LUpdateModel {
  int? index;
  String? eventName;
  String? color;

  LUpdateModel({this.index, this.eventName, this.color});
}

enum EventName {
  HomeChangeColor
}

extension EventNameValue on EventName {
  String get name {
    switch (this) {
      case EventName.HomeChangeColor:
        return 'HomeChangeColor';
    }
  }
}
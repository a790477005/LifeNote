
class HomeChatModel {
  String? content;
  int role = 0; // 0 代表自己 1 代表对方

  HomeChatModel({this.content, this.role = 0});

  HomeChatModel.fromMap(Map<String, dynamic> map)
      : content = map['content'],
        role = map['role'] ?? 0;

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'role': role,
    };
  }
}

enum HomeChatAction {
  chat
}

extension HomeChatActionExtension on HomeChatAction {
  String get value {
    switch (this) {
      case HomeChatAction.chat:
        return 'chat';
      default:
        return '';
    }
  }
}

class HomeChatBaseModel {
  String? from;
  String? connectUid;
  Data? data;
  int? time;
  String? action;
  String? uid;

  HomeChatBaseModel({this.from, this.connectUid, this.data, this.time, this.action});

  HomeChatBaseModel.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    connectUid = json['connectUid'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    time = json['time'];
    action = json['action'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['connectUid'] = this.connectUid;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['time'] = this.time;
    data['action'] = this.action;
    data['uid'] = this.uid;
    return data;
  }
}

class Data {
  String? msg;
  String? action;

  Data({this.msg , this.action});

  Data.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['action'] = this.action;
    return data;
  }
}
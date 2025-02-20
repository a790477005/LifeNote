class HomeChatBindModel {
  int? errCode;
  String? errMsg;
  Data? data;

  HomeChatBindModel({this.errCode, this.errMsg, this.data});

  HomeChatBindModel.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errCode'] = this.errCode;
    data['errMsg'] = this.errMsg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? uid;
  String? connectUid;

  Data({this.uid, this.connectUid});

  Data.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    connectUid = json['connectUid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['connectUid'] = this.connectUid;
    return data;
  }
}
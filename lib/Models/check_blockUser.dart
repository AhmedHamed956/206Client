class CheckBlockModel {
  CheckBlockData? data;
  String? message;

  CheckBlockModel({this.data, this.message});

  CheckBlockModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new CheckBlockData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class CheckBlockData {
  int? blocked;

  CheckBlockData({this.blocked});

  CheckBlockData.fromJson(Map<String, dynamic> json) {
    blocked = json['blocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blocked'] = this.blocked;
    return data;
  }
}

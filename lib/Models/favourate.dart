class FavourateModel {
  String? status;
  FavourateModelData? data;
  String? message;

  FavourateModel({this.status, this.data, this.message});

  FavourateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new FavourateModelData.fromJson(json['data'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class FavourateModelData {
  bool? isFavorite;

  FavourateModelData({this.isFavorite});

  FavourateModelData.fromJson(Map<String, dynamic> json) {
    isFavorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_favorite'] = this.isFavorite;
    return data;
  }
}

class UpdateMapModel {
  String? status;
  List<UpdateMapModelData>? data;

  UpdateMapModel({this.status, this.data});

  UpdateMapModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <UpdateMapModelData>[];
      json['data'].forEach((v) {
        data!.add(new UpdateMapModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpdateMapModelData {
  int? id;
  List<Translations>? translations;
  String? phone;
  String? lat;
  String? long;
  int? distance;
  int? isSpecial;
  int? shopId;
  int? activated;
  bool? isOpen;
  List<WorkDays>? workDays;

  UpdateMapModelData(
      {this.id,
      this.translations,
      this.phone,
      this.lat,
      this.long,
      this.distance,
      this.isSpecial,
      this.shopId,
      this.activated,
      this.isOpen,
      this.workDays});

  UpdateMapModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
    phone = json['phone'];
    lat = json['lat'];
    long = json['long'];
    distance = json['distance'];
    isSpecial = json['isSpecial'];
    shopId = json['shop_id'];
    activated = json['activated'];
    isOpen = json['is_open'];
    if (json['work_days'] != null) {
      workDays = <WorkDays>[];
      json['work_days'].forEach((v) {
        workDays!.add(new WorkDays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    data['phone'] = this.phone;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['distance'] = this.distance;
    data['isSpecial'] = this.isSpecial;
    data['shop_id'] = this.shopId;
    data['activated'] = this.activated;
    data['is_open'] = this.isOpen;
    if (this.workDays != null) {
      data['work_days'] = this.workDays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  int? branchId;
  String? locale;
  String? name;

  Translations({this.id, this.branchId, this.locale, this.name});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    locale = json['locale'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    return data;
  }
}

class WorkDays {
  int? id;
  int? branchId;
  String? day;
  String? start;
  String? end;
  String? status;
  String? createdAt;
  String? updatedAt;

  WorkDays(
      {this.id,
      this.branchId,
      this.day,
      this.start,
      this.end,
      this.status,
      this.createdAt,
      this.updatedAt});

  WorkDays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    day = json['day'];
    start = json['start'];
    end = json['end'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['day'] = this.day;
    data['start'] = this.start;
    data['end'] = this.end;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

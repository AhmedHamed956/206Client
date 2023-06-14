class UserModel {
  UserData? data;
  String? message;

  UserModel({this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
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

class UserData {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? phone;
  String? image;
  int? status;
  Null? managerId;
  Null? workLocation;
  Null? fcmToken;
  int? isCustomer;
  int? isDelivery;
  int? isCashier;
  int? isInvestor;
  int? isAdmin;
  String? createdAt;
  String? updatedAt;
  String? token;
  Null? latitude;
  Null? longitude;
  Null? branchId;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.image,
      this.status,
      this.managerId,
      this.workLocation,
      this.fcmToken,
      this.isCustomer,
      this.isDelivery,
      this.isCashier,
      this.isInvestor,
      this.isAdmin,
      this.createdAt,
      this.updatedAt,
      this.token,
      this.latitude,
      this.longitude,
      this.branchId});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    image = json['image'];
    status = json['status'];
    managerId = json['manager_id'];
    workLocation = json['work_location'];
    fcmToken = json['fcm_token'];
    isCustomer = json['is_customer'];
    isDelivery = json['is_delivery'];
    isCashier = json['is_cashier'];
    isInvestor = json['is_investor'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    branchId = json['branch_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['status'] = this.status;
    data['manager_id'] = this.managerId;
    data['work_location'] = this.workLocation;
    data['fcm_token'] = this.fcmToken;
    data['is_customer'] = this.isCustomer;
    data['is_delivery'] = this.isDelivery;
    data['is_cashier'] = this.isCashier;
    data['is_investor'] = this.isInvestor;
    data['is_admin'] = this.isAdmin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['branch_id'] = this.branchId;
    return data;
  }
}

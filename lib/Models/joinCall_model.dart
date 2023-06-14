class JoinCallModel {
  String? status;
  JoinCallModelData? data;

  JoinCallModel({this.status, this.data});

  JoinCallModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new JoinCallModelData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class JoinCallModelData {
  bool? isWaiting;
  int? numOfWaiting;
  String? timeCall;
  String? type;
  bool? anotherCall;
  String? clientToken;
  Null? cashierToken;
  String? channelName;

  JoinCallModelData(
      {this.isWaiting,
      this.numOfWaiting,
      this.timeCall,
      this.type,
      this.anotherCall,
      this.clientToken,
      this.cashierToken,
      this.channelName});

  JoinCallModelData.fromJson(Map<String, dynamic> json) {
    isWaiting = json['is_waiting'];
    numOfWaiting = json['num_of_waiting'];
    timeCall = json['time_call'];
    type = json['type'];
    anotherCall = json['another_call'];
    clientToken = json['client_token'];
    cashierToken = json['cashier_token'];
    channelName = json['channel_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_waiting'] = this.isWaiting;
    data['num_of_waiting'] = this.numOfWaiting;
    data['time_call'] = this.timeCall;
    data['type'] = this.type;
    data['another_call'] = this.anotherCall;
    data['client_token'] = this.clientToken;
    data['cashier_token'] = this.cashierToken;
    data['channel_name'] = this.channelName;
    return data;
  }
}

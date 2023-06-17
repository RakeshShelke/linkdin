/// status : true
/// msg : "We have sent the otp for reset password on your associate email"
/// info : {"user_id":"2","otp":6662,"mobile_no":"9098872799"}

class ForgetPasswordResponse {
  ForgetPasswordResponse({
      bool? status, 
      String? msg, 
      Info? info,}){
    _status = status;
    _msg = msg;
    _info = info;
}

  ForgetPasswordResponse.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }
  bool? _status;
  String? _msg;
  Info? _info;
ForgetPasswordResponse copyWith({  bool? status,
  String? msg,
  Info? info,
}) => ForgetPasswordResponse(  status: status ?? _status,
  msg: msg ?? _msg,
  info: info ?? _info,
);
  bool? get status => _status;
  String? get msg => _msg;
  Info? get info => _info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_info != null) {
      map['info'] = _info?.toJson();
    }
    return map;
  }

}

/// user_id : "2"
/// otp : 6662
/// mobile_no : "9098872799"

class Info {
  Info({
      String? userId, 
      num? otp, 
      String? mobileNo,}){
    _userId = userId;
    _otp = otp;
    _mobileNo = mobileNo;
}

  Info.fromJson(dynamic json) {
    _userId = json['user_id'];
    _otp = json['otp'];
    _mobileNo = json['mobile_no'];
  }
  String? _userId;
  num? _otp;
  String? _mobileNo;
Info copyWith({  String? userId,
  num? otp,
  String? mobileNo,
}) => Info(  userId: userId ?? _userId,
  otp: otp ?? _otp,
  mobileNo: mobileNo ?? _mobileNo,
);
  String? get userId => _userId;
  num? get otp => _otp;
  String? get mobileNo => _mobileNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['otp'] = _otp;
    map['mobile_no'] = _mobileNo;
    return map;
  }

}
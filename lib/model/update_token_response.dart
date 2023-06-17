/// status : "sucess"
/// msg : "Token Saved Sucessfull"

class UpdateTokenResponse {
  UpdateTokenResponse({
      String? status, 
      String? msg,}){
    _status = status;
    _msg = msg;
}

  UpdateTokenResponse.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
  }
  String? _status;
  String? _msg;
UpdateTokenResponse copyWith({  String? status,
  String? msg,
}) => UpdateTokenResponse(  status: status ?? _status,
  msg: msg ?? _msg,
);
  String? get status => _status;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    return map;
  }

}
/// status : "sucess"
/// msg : "Profile Updated Sucessfull"

class AddBioResponse {
  AddBioResponse({
      String? status, 
      String? msg,}){
    _status = status;
    _msg = msg;
}

  AddBioResponse.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
  }
  String? _status;
  String? _msg;
AddBioResponse copyWith({  String? status,
  String? msg,
}) => AddBioResponse(  status: status ?? _status,
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
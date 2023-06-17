/// status : "sucess"
/// msg : "Course Added Sucessfull"

class AddCoachResponse {
  AddCoachResponse({
      String? status, 
      String? msg,}){
    _status = status;
    _msg = msg;
}

  AddCoachResponse.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
  }
  String? _status;
  String? _msg;
AddCoachResponse copyWith({  String? status,
  String? msg,
}) => AddCoachResponse(  status: status ?? _status,
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
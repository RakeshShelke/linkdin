/// status : true
/// msg : "Profile has been successfully update"

class UpdateBioInformation {
  UpdateBioInformation({
      bool? status, 
      String? msg,}){
    _status = status;
    _msg = msg;
}

  UpdateBioInformation.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
  }
  bool? _status;
  String? _msg;
UpdateBioInformation copyWith({  bool? status,
  String? msg,
}) => UpdateBioInformation(  status: status ?? _status,
  msg: msg ?? _msg,
);
  bool? get status => _status;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    return map;
  }

}
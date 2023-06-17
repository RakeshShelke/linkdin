/// status : true
/// msg : "File Successfully Uploaded"

class ResumeUploadResponse {
  ResumeUploadResponse({
      bool? status, 
      String? msg,}){
    _status = status;
    _msg = msg;
}

  ResumeUploadResponse.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
  }
  bool? _status;
  String? _msg;
ResumeUploadResponse copyWith({  bool? status,
  String? msg,
}) => ResumeUploadResponse(  status: status ?? _status,
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
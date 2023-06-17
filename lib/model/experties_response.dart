/// status : true
/// experties_list : [{"experties_id":"4","experties_title":"pratik","user_id":"78","status":"1"},{"experties_id":"8","experties_title":"test","user_id":"78","status":"1"},{"experties_id":"9","experties_title":"Test 2312","user_id":"78","status":"1"},{"experties_id":"10","experties_title":"Test c","user_id":"78","status":"1"}]

class ExpertiesResponse {
  ExpertiesResponse({
      bool? status, 
      List<ExpertiesList>? expertiesList,}){
    _status = status;
    _expertiesList = expertiesList;
}

  ExpertiesResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['experties_list'] != null) {
      _expertiesList = [];
      json['experties_list'].forEach((v) {
        _expertiesList?.add(ExpertiesList.fromJson(v));
      });
    }
  }
  bool? _status;
  List<ExpertiesList>? _expertiesList;
ExpertiesResponse copyWith({  bool? status,
  List<ExpertiesList>? expertiesList,
}) => ExpertiesResponse(  status: status ?? _status,
  expertiesList: expertiesList ?? _expertiesList,
);
  bool? get status => _status;
  List<ExpertiesList>? get expertiesList => _expertiesList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_expertiesList != null) {
      map['experties_list'] = _expertiesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// experties_id : "4"
/// experties_title : "pratik"
/// user_id : "78"
/// status : "1"

class ExpertiesList {
  ExpertiesList({
      String? expertiesId, 
      String? expertiesTitle, 
      String? userId, 
      String? status,}){
    _expertiesId = expertiesId;
    _expertiesTitle = expertiesTitle;
    _userId = userId;
    _status = status;
}

  ExpertiesList.fromJson(dynamic json) {
    _expertiesId = json['experties_id'];
    _expertiesTitle = json['experties_title'];
    _userId = json['user_id'];
    _status = json['status'];
  }
  String? _expertiesId;
  String? _expertiesTitle;
  String? _userId;
  String? _status;
ExpertiesList copyWith({  String? expertiesId,
  String? expertiesTitle,
  String? userId,
  String? status,
}) => ExpertiesList(  expertiesId: expertiesId ?? _expertiesId,
  expertiesTitle: expertiesTitle ?? _expertiesTitle,
  userId: userId ?? _userId,
  status: status ?? _status,
);
  String? get expertiesId => _expertiesId;
  String? get expertiesTitle => _expertiesTitle;
  String? get userId => _userId;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['experties_id'] = _expertiesId;
    map['experties_title'] = _expertiesTitle;
    map['user_id'] = _userId;
    map['status'] = _status;
    return map;
  }

}
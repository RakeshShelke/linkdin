/// status : true
/// course_list : [{"courses_id":"7","user_id":"77","courses_name":"Test course Name","profession":"Profress Name test ","elegibility":"test eligibility ","duration":"20 months","fees":"154100","entrance_exam":"asdfasdf test","description":"asdf","download_brouchure":null,"created_date":"2023-05-18 17:52:54","status":"0"},{"courses_id":"8","user_id":"77","courses_name":"Test course Name","profession":"Profress Name test ","elegibility":"test eligibility ","duration":"20 months","fees":"154100","entrance_exam":"asdfasdf test","description":"asdf","download_brouchure":null,"created_date":"2023-05-18 17:54:05","status":"0"},{"courses_id":"9","user_id":"77","courses_name":"Test course Name","profession":"Profress Name test ","elegibility":"test eligibility ","duration":"20 months","fees":"154100","entrance_exam":"asdfasdf test","description":"asdf","download_brouchure":null,"created_date":"2023-05-18 17:54:59","status":"0"}]

class GetCourseDetails {
  GetCourseDetails({
      bool? status, 
      List<CourseList>? courseList,}){
    _status = status;
    _courseList = courseList;
}

  GetCourseDetails.fromJson(dynamic json) {
    _status = json['status'];
    if (json['course_list'] != null) {
      _courseList = [];
      json['course_list'].forEach((v) {
        _courseList?.add(CourseList.fromJson(v));
      });
    }
  }
  bool? _status;
  List<CourseList>? _courseList;
GetCourseDetails copyWith({  bool? status,
  List<CourseList>? courseList,
}) => GetCourseDetails(  status: status ?? _status,
  courseList: courseList ?? _courseList,
);
  bool? get status => _status;
  List<CourseList>? get courseList => _courseList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_courseList != null) {
      map['course_list'] = _courseList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// courses_id : "7"
/// user_id : "77"
/// courses_name : "Test course Name"
/// profession : "Profress Name test "
/// elegibility : "test eligibility "
/// duration : "20 months"
/// fees : "154100"
/// entrance_exam : "asdfasdf test"
/// description : "asdf"
/// download_brouchure : null
/// created_date : "2023-05-18 17:52:54"
/// status : "0"

class CourseList {
  CourseList({
      String? coursesId, 
      String? userId, 
      String? coursesName, 
      String? profession, 
      String? elegibility, 
      String? duration, 
      String? fees, 
      String? entranceExam, 
      String? description, 
      dynamic downloadBrouchure, 
      String? createdDate, 
      String? status,}){
    _coursesId = coursesId;
    _userId = userId;
    _coursesName = coursesName;
    _profession = profession;
    _elegibility = elegibility;
    _duration = duration;
    _fees = fees;
    _entranceExam = entranceExam;
    _description = description;
    _downloadBrouchure = downloadBrouchure;
    _createdDate = createdDate;
    _status = status;
}

  CourseList.fromJson(dynamic json) {
    _coursesId = json['courses_id'];
    _userId = json['user_id'];
    _coursesName = json['courses_name'];
    _profession = json['profession'];
    _elegibility = json['elegibility'];
    _duration = json['duration'];
    _fees = json['fees'];
    _entranceExam = json['entrance_exam'];
    _description = json['description'];
    _downloadBrouchure = json['download_brouchure'];
    _createdDate = json['created_date'];
    _status = json['status'];
  }
  String? _coursesId;
  String? _userId;
  String? _coursesName;
  String? _profession;
  String? _elegibility;
  String? _duration;
  String? _fees;
  String? _entranceExam;
  String? _description;
  dynamic _downloadBrouchure;
  String? _createdDate;
  String? _status;
CourseList copyWith({  String? coursesId,
  String? userId,
  String? coursesName,
  String? profession,
  String? elegibility,
  String? duration,
  String? fees,
  String? entranceExam,
  String? description,
  dynamic downloadBrouchure,
  String? createdDate,
  String? status,
}) => CourseList(  coursesId: coursesId ?? _coursesId,
  userId: userId ?? _userId,
  coursesName: coursesName ?? _coursesName,
  profession: profession ?? _profession,
  elegibility: elegibility ?? _elegibility,
  duration: duration ?? _duration,
  fees: fees ?? _fees,
  entranceExam: entranceExam ?? _entranceExam,
  description: description ?? _description,
  downloadBrouchure: downloadBrouchure ?? _downloadBrouchure,
  createdDate: createdDate ?? _createdDate,
  status: status ?? _status,
);
  String? get coursesId => _coursesId;
  String? get userId => _userId;
  String? get coursesName => _coursesName;
  String? get profession => _profession;
  String? get elegibility => _elegibility;
  String? get duration => _duration;
  String? get fees => _fees;
  String? get entranceExam => _entranceExam;
  String? get description => _description;
  dynamic get downloadBrouchure => _downloadBrouchure;
  String? get createdDate => _createdDate;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['courses_id'] = _coursesId;
    map['user_id'] = _userId;
    map['courses_name'] = _coursesName;
    map['profession'] = _profession;
    map['elegibility'] = _elegibility;
    map['duration'] = _duration;
    map['fees'] = _fees;
    map['entrance_exam'] = _entranceExam;
    map['description'] = _description;
    map['download_brouchure'] = _downloadBrouchure;
    map['created_date'] = _createdDate;
    map['status'] = _status;
    return map;
  }

}
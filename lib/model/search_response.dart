/// status : true
/// msg : "Success"
/// listX : [{"user_id":"54","user_unique_id":"ND0054","user_type_id":"7","name":"Pratik katariya company","last_name":"","profile_headline":"","profile_title":"","birth_date":null,"email":"pratik@gmail.com","phone_no":"9826628972","password":"123456","profile_image":"pimage_1677957444.jpeg","location":"","city":"","gender":"Male","skills":"5,6,8,9,1,,","referral_code":"","fcid":"BkWXtOwSjAMuY1t5nJRsYhPbMWF2","create_date":"2023-03-04 19:01:09","status":"1","cover_image":"pimage_1677957436.jpeg","upload_file":"docu_1683475623.pdf","document_type":"3","certification_data":null,"request_status":"0","_token":null,"token_generator":null,"user_type":"Company","connected_chat_status":"0"}]
/// jobList : [{"job_id":"3","job_unique_id":"NJB03","job_type":"Private job","job_title":"Python Developer - Django/Flask","employment_type":"Full Time","position":"Full Stack Developer","company_name":"Rishyaa Digicorp","job_timing":"Monday to Friday","location":"indore","no_of_vacancy":"5","salary":"4,00,000 - 9,00,000","salary_rate_type":"Year","jobs_description":"<p>- We are looking for a Python Developer to join our engineering team and help us develop and maintain various software products.<br />\r\n<br />\r\n- Python Developer responsibilities include writing and testing code, debugging programs and integrating applications with third-party web services.<br />\r\n<br />\r\nResponsibilities :<br />\r\n<br />\r\n- Write effective, scalable code<br />\r\n<br />\r\n- Develop back-end components to improve responsiveness and overall performance<br />\r\n<br />\r\n- Integrate user-facing elements into applications<br />\r\n<br />\r\n- Test and debug programs<br />\r\n<br />\r\n- Improve functionality of existing systems<br />\r\n<br />\r\n- Assess and prioritize feature requests<br />\r\n<br />\r\n- Coordinate with internal teams to understand user requirements and provide technical solutions.<br />\r\n<br />\r\nRequirements :<br />\r\n<br />\r\n- Knowledge on python.<br />\r\n<br />\r\n- Knowledge in at least one popular Python framework (like Django, Flask or Pyramid).<br />\r\n<br />\r\n- Good problem-solving skills.<br />\r\n<br />\r\n- Good Communication skills.<br />\r\n<br />\r\n- Ability to work on new Technologies.</p>\r\n","attachment_file":"","experience_required":"5 year","education_required":"No","document_required":"No","skills_required":"Python/Data","user_id":"1","company_logo":"","govt_job_external_link":"0","status":"1","promoted":"1","promot_end_date":"2022-10-20","create_date":"2022-08-20 15:26:34"}]
/// top_category : [{"category_id":"1","category_title":"Courses","image":"courses.png","status":"1"},{"category_id":"2","category_title":"Professions","image":"professions.png","status":"1"},{"category_id":"3","category_title":"Institutes","image":"institutes.png","status":"1"},{"category_id":"5","category_title":"Entrance Exams","image":"entrance_exams.png","status":"1"},{"category_id":"6","category_title":"Certification Center","image":"certificate.png","status":"1"},{"category_id":"7","category_title":"Sports Academy","image":"sports.png","status":"1"},{"category_id":"8","category_title":"Overseas Education","image":"overseas_education.png","status":"1"},{"category_id":"9","category_title":"Notice Board","image":"pimage_1683873401.jpg","status":"1"},{"category_id":"10","category_title":"Colleges","image":"pimage_1683873360.png","status":"1"},{"category_id":"0","category_title":"All","image":"dummy.png","status":"1"}]

class SearchResponse {
  SearchResponse({
      bool? status, 
      String? msg, 
      List<ListX>? listX, 
      List<JobList>? jobList, 
      List<TopCategory>? topCategory,}){
    _status = status;
    _msg = msg;
    _listX = listX;
    _jobList = jobList;
    _topCategory = topCategory;
}

  SearchResponse.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    if (json['list'] != null) {
      _listX = [];
      json['list'].forEach((v) {
        _listX?.add(ListX.fromJson(v));
      });
    }
    if (json['jobList'] != null) {
      _jobList = [];
      json['jobList'].forEach((v) {
        _jobList?.add(JobList.fromJson(v));
      });
    }
    if (json['top_category'] != null) {
      _topCategory = [];
      json['top_category'].forEach((v) {
        _topCategory?.add(TopCategory.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _msg;
  List<ListX>? _listX;
  List<JobList>? _jobList;
  List<TopCategory>? _topCategory;
SearchResponse copyWith({  bool? status,
  String? msg,
  List<ListX>? listX,
  List<JobList>? jobList,
  List<TopCategory>? topCategory,
}) => SearchResponse(  status: status ?? _status,
  msg: msg ?? _msg,
  listX: listX ?? _listX,
  jobList: jobList ?? _jobList,
  topCategory: topCategory ?? _topCategory,
);
  bool? get status => _status;
  String? get msg => _msg;
  List<ListX>? get listX => _listX;
  List<JobList>? get jobList => _jobList;
  List<TopCategory>? get topCategory => _topCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_listX != null) {
      map['list'] = _listX?.map((v) => v.toJson()).toList();
    }
    if (_jobList != null) {
      map['jobList'] = _jobList?.map((v) => v.toJson()).toList();
    }
    if (_topCategory != null) {
      map['top_category'] = _topCategory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// category_id : "1"
/// category_title : "Courses"
/// image : "courses.png"
/// status : "1"

class TopCategory {
  TopCategory({
      String? categoryId, 
      String? categoryTitle, 
      String? image, 
      String? status,}){
    _categoryId = categoryId;
    _categoryTitle = categoryTitle;
    _image = image;
    _status = status;
}

  TopCategory.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _categoryTitle = json['category_title'];
    _image = json['image'];
    _status = json['status'];
  }
  String? _categoryId;
  String? _categoryTitle;
  String? _image;
  String? _status;
TopCategory copyWith({  String? categoryId,
  String? categoryTitle,
  String? image,
  String? status,
}) => TopCategory(  categoryId: categoryId ?? _categoryId,
  categoryTitle: categoryTitle ?? _categoryTitle,
  image: image ?? _image,
  status: status ?? _status,
);
  String? get categoryId => _categoryId;
  String? get categoryTitle => _categoryTitle;
  String? get image => _image;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['category_title'] = _categoryTitle;
    map['image'] = _image;
    map['status'] = _status;
    return map;
  }

}

/// job_id : "3"
/// job_unique_id : "NJB03"
/// job_type : "Private job"
/// job_title : "Python Developer - Django/Flask"
/// employment_type : "Full Time"
/// position : "Full Stack Developer"
/// company_name : "Rishyaa Digicorp"
/// job_timing : "Monday to Friday"
/// location : "indore"
/// no_of_vacancy : "5"
/// salary : "4,00,000 - 9,00,000"
/// salary_rate_type : "Year"
/// jobs_description : "<p>- We are looking for a Python Developer to join our engineering team and help us develop and maintain various software products.<br />\r\n<br />\r\n- Python Developer responsibilities include writing and testing code, debugging programs and integrating applications with third-party web services.<br />\r\n<br />\r\nResponsibilities :<br />\r\n<br />\r\n- Write effective, scalable code<br />\r\n<br />\r\n- Develop back-end components to improve responsiveness and overall performance<br />\r\n<br />\r\n- Integrate user-facing elements into applications<br />\r\n<br />\r\n- Test and debug programs<br />\r\n<br />\r\n- Improve functionality of existing systems<br />\r\n<br />\r\n- Assess and prioritize feature requests<br />\r\n<br />\r\n- Coordinate with internal teams to understand user requirements and provide technical solutions.<br />\r\n<br />\r\nRequirements :<br />\r\n<br />\r\n- Knowledge on python.<br />\r\n<br />\r\n- Knowledge in at least one popular Python framework (like Django, Flask or Pyramid).<br />\r\n<br />\r\n- Good problem-solving skills.<br />\r\n<br />\r\n- Good Communication skills.<br />\r\n<br />\r\n- Ability to work on new Technologies.</p>\r\n"
/// attachment_file : ""
/// experience_required : "5 year"
/// education_required : "No"
/// document_required : "No"
/// skills_required : "Python/Data"
/// user_id : "1"
/// company_logo : ""
/// govt_job_external_link : "0"
/// status : "1"
/// promoted : "1"
/// promot_end_date : "2022-10-20"
/// create_date : "2022-08-20 15:26:34"

class JobList {
  String? addWishlistStatus;

  JobList({
      String? jobId, 
      String? jobUniqueId, 
      String? jobType, 
      String? jobTitle, 
      String? employmentType, 
      String? position, 
      String? companyName, 
      String? jobTiming, 
      String? location, 
      String? noOfVacancy, 
      String? salary, 
      String? salaryRateType, 
      String? jobsDescription, 
      String? attachmentFile, 
      String? experienceRequired, 
      String? educationRequired, 
      String? documentRequired, 
      String? skillsRequired, 
      String? userId, 
      String? companyLogo, 
      String? govtJobExternalLink, 
      String? status, 
      String? promoted, 
      String? promotEndDate, 
      String? createDate,}){
    _jobId = jobId;
    _jobUniqueId = jobUniqueId;
    _jobType = jobType;
    _jobTitle = jobTitle;
    _employmentType = employmentType;
    _position = position;
    _companyName = companyName;
    _jobTiming = jobTiming;
    _location = location;
    _noOfVacancy = noOfVacancy;
    _salary = salary;
    _salaryRateType = salaryRateType;
    _jobsDescription = jobsDescription;
    _attachmentFile = attachmentFile;
    _experienceRequired = experienceRequired;
    _educationRequired = educationRequired;
    _documentRequired = documentRequired;
    _skillsRequired = skillsRequired;
    _userId = userId;
    _companyLogo = companyLogo;
    _govtJobExternalLink = govtJobExternalLink;
    _status = status;
    _promoted = promoted;
    _promotEndDate = promotEndDate;
    _createDate = createDate;
}

  JobList.fromJson(dynamic json) {
    _jobId = json['job_id'];
    _jobUniqueId = json['job_unique_id'];
    _jobType = json['job_type'];
    _jobTitle = json['job_title'];
    _employmentType = json['employment_type'];
    _position = json['position'];
    _companyName = json['company_name'];
    _jobTiming = json['job_timing'];
    _location = json['location'];
    _noOfVacancy = json['no_of_vacancy'];
    _salary = json['salary'];
    _salaryRateType = json['salary_rate_type'];
    _jobsDescription = json['jobs_description'];
    _attachmentFile = json['attachment_file'];
    _experienceRequired = json['experience_required'];
    _educationRequired = json['education_required'];
    _documentRequired = json['document_required'];
    _skillsRequired = json['skills_required'];
    _userId = json['user_id'];
    _companyLogo = json['company_logo'];
    _govtJobExternalLink = json['govt_job_external_link'];
    _status = json['status'];
    _promoted = json['promoted'];
    _promotEndDate = json['promot_end_date'];
    _createDate = json['create_date'];
  }
  String? _jobId;
  String? _jobUniqueId;
  String? _jobType;
  String? _jobTitle;
  String? _employmentType;
  String? _position;
  String? _companyName;
  String? _jobTiming;
  String? _location;
  String? _noOfVacancy;
  String? _salary;
  String? _salaryRateType;
  String? _jobsDescription;
  String? _attachmentFile;
  String? _experienceRequired;
  String? _educationRequired;
  String? _documentRequired;
  String? _skillsRequired;
  String? _userId;
  String? _companyLogo;
  String? _govtJobExternalLink;
  String? _status;
  String? _promoted;
  String? _promotEndDate;
  String? _createDate;
JobList copyWith({  String? jobId,
  String? jobUniqueId,
  String? jobType,
  String? jobTitle,
  String? employmentType,
  String? position,
  String? companyName,
  String? jobTiming,
  String? location,
  String? noOfVacancy,
  String? salary,
  String? salaryRateType,
  String? jobsDescription,
  String? attachmentFile,
  String? experienceRequired,
  String? educationRequired,
  String? documentRequired,
  String? skillsRequired,
  String? userId,
  String? companyLogo,
  String? govtJobExternalLink,
  String? status,
  String? promoted,
  String? promotEndDate,
  String? createDate,
}) => JobList(  jobId: jobId ?? _jobId,
  jobUniqueId: jobUniqueId ?? _jobUniqueId,
  jobType: jobType ?? _jobType,
  jobTitle: jobTitle ?? _jobTitle,
  employmentType: employmentType ?? _employmentType,
  position: position ?? _position,
  companyName: companyName ?? _companyName,
  jobTiming: jobTiming ?? _jobTiming,
  location: location ?? _location,
  noOfVacancy: noOfVacancy ?? _noOfVacancy,
  salary: salary ?? _salary,
  salaryRateType: salaryRateType ?? _salaryRateType,
  jobsDescription: jobsDescription ?? _jobsDescription,
  attachmentFile: attachmentFile ?? _attachmentFile,
  experienceRequired: experienceRequired ?? _experienceRequired,
  educationRequired: educationRequired ?? _educationRequired,
  documentRequired: documentRequired ?? _documentRequired,
  skillsRequired: skillsRequired ?? _skillsRequired,
  userId: userId ?? _userId,
  companyLogo: companyLogo ?? _companyLogo,
  govtJobExternalLink: govtJobExternalLink ?? _govtJobExternalLink,
  status: status ?? _status,
  promoted: promoted ?? _promoted,
  promotEndDate: promotEndDate ?? _promotEndDate,
  createDate: createDate ?? _createDate,
);
  String? get jobId => _jobId;
  String? get jobUniqueId => _jobUniqueId;
  String? get jobType => _jobType;
  String? get jobTitle => _jobTitle;
  String? get employmentType => _employmentType;
  String? get position => _position;
  String? get companyName => _companyName;
  String? get jobTiming => _jobTiming;
  String? get location => _location;
  String? get noOfVacancy => _noOfVacancy;
  String? get salary => _salary;
  String? get salaryRateType => _salaryRateType;
  String? get jobsDescription => _jobsDescription;
  String? get attachmentFile => _attachmentFile;
  String? get experienceRequired => _experienceRequired;
  String? get educationRequired => _educationRequired;
  String? get documentRequired => _documentRequired;
  String? get skillsRequired => _skillsRequired;
  String? get userId => _userId;
  String? get companyLogo => _companyLogo;
  String? get govtJobExternalLink => _govtJobExternalLink;
  String? get status => _status;
  String? get promoted => _promoted;
  String? get promotEndDate => _promotEndDate;
  String? get createDate => _createDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['job_id'] = _jobId;
    map['job_unique_id'] = _jobUniqueId;
    map['job_type'] = _jobType;
    map['job_title'] = _jobTitle;
    map['employment_type'] = _employmentType;
    map['position'] = _position;
    map['company_name'] = _companyName;
    map['job_timing'] = _jobTiming;
    map['location'] = _location;
    map['no_of_vacancy'] = _noOfVacancy;
    map['salary'] = _salary;
    map['salary_rate_type'] = _salaryRateType;
    map['jobs_description'] = _jobsDescription;
    map['attachment_file'] = _attachmentFile;
    map['experience_required'] = _experienceRequired;
    map['education_required'] = _educationRequired;
    map['document_required'] = _documentRequired;
    map['skills_required'] = _skillsRequired;
    map['user_id'] = _userId;
    map['company_logo'] = _companyLogo;
    map['govt_job_external_link'] = _govtJobExternalLink;
    map['status'] = _status;
    map['promoted'] = _promoted;
    map['promot_end_date'] = _promotEndDate;
    map['create_date'] = _createDate;
    return map;
  }

}

/// user_id : "54"
/// user_unique_id : "ND0054"
/// user_type_id : "7"
/// name : "Pratik katariya company"
/// last_name : ""
/// profile_headline : ""
/// profile_title : ""
/// birth_date : null
/// email : "pratik@gmail.com"
/// phone_no : "9826628972"
/// password : "123456"
/// profile_image : "pimage_1677957444.jpeg"
/// location : ""
/// city : ""
/// gender : "Male"
/// skills : "5,6,8,9,1,,"
/// referral_code : ""
/// fcid : "BkWXtOwSjAMuY1t5nJRsYhPbMWF2"
/// create_date : "2023-03-04 19:01:09"
/// status : "1"
/// cover_image : "pimage_1677957436.jpeg"
/// upload_file : "docu_1683475623.pdf"
/// document_type : "3"
/// certification_data : null
/// request_status : "0"
/// _token : null
/// token_generator : null
/// user_type : "Company"
/// connected_chat_status : "0"

class ListX {
  ListX({
      String? userId, 
      String? userUniqueId, 
      String? userTypeId, 
      String? name, 
      String? lastName, 
      String? profileHeadline, 
      String? profileTitle, 
      dynamic birthDate, 
      String? email, 
      String? phoneNo, 
      String? password, 
      String? profileImage, 
      String? location, 
      String? city, 
      String? gender, 
      String? skills, 
      String? referralCode, 
      String? fcid, 
      String? createDate, 
      String? status, 
      String? coverImage, 
      String? uploadFile, 
      String? documentType, 
      dynamic certificationData, 
      String? requestStatus, 
      dynamic token, 
      dynamic tokenGenerator, 
      String? userType, 
      String? connectedChatStatus,}){
    _userId = userId;
    _userUniqueId = userUniqueId;
    _userTypeId = userTypeId;
    _name = name;
    _lastName = lastName;
    _profileHeadline = profileHeadline;
    _profileTitle = profileTitle;
    _birthDate = birthDate;
    _email = email;
    _phoneNo = phoneNo;
    _password = password;
    _profileImage = profileImage;
    _location = location;
    _city = city;
    _gender = gender;
    _skills = skills;
    _referralCode = referralCode;
    _fcid = fcid;
    _createDate = createDate;
    _status = status;
    _coverImage = coverImage;
    _uploadFile = uploadFile;
    _documentType = documentType;
    _certificationData = certificationData;
    _requestStatus = requestStatus;
    _token = token;
    _tokenGenerator = tokenGenerator;
    _userType = userType;
    _connectedChatStatus = connectedChatStatus;
}

  ListX.fromJson(dynamic json) {
    _userId = json['user_id'];
    _userUniqueId = json['user_unique_id'];
    _userTypeId = json['user_type_id'];
    _name = json['name'];
    _lastName = json['last_name'];
    _profileHeadline = json['profile_headline'];
    _profileTitle = json['profile_title'];
    _birthDate = json['birth_date'];
    _email = json['email'];
    _phoneNo = json['phone_no'];
    _password = json['password'];
    _profileImage = json['profile_image'];
    _location = json['location'];
    _city = json['city'];
    _gender = json['gender'];
    _skills = json['skills'];
    _referralCode = json['referral_code'];
    _fcid = json['fcid'];
    _createDate = json['create_date'];
    _status = json['status'];
    _coverImage = json['cover_image'];
    _uploadFile = json['upload_file'];
    _documentType = json['document_type'];
    _certificationData = json['certification_data'];
    _requestStatus = json['request_status'];
    _token = json['_token'];
    _tokenGenerator = json['token_generator'];
    _userType = json['user_type'];
    _connectedChatStatus = json['connected_chat_status'];
  }
  String? _userId;
  String? _userUniqueId;
  String? _userTypeId;
  String? _name;
  String? _lastName;
  String? _profileHeadline;
  String? _profileTitle;
  dynamic _birthDate;
  String? _email;
  String? _phoneNo;
  String? _password;
  String? _profileImage;
  String? _location;
  String? _city;
  String? _gender;
  String? _skills;
  String? _referralCode;
  String? _fcid;
  String? _createDate;
  String? _status;
  String? _coverImage;
  String? _uploadFile;
  String? _documentType;
  dynamic _certificationData;
  String? _requestStatus;
  dynamic _token;
  dynamic _tokenGenerator;
  String? _userType;
  String? _connectedChatStatus;
ListX copyWith({  String? userId,
  String? userUniqueId,
  String? userTypeId,
  String? name,
  String? lastName,
  String? profileHeadline,
  String? profileTitle,
  dynamic birthDate,
  String? email,
  String? phoneNo,
  String? password,
  String? profileImage,
  String? location,
  String? city,
  String? gender,
  String? skills,
  String? referralCode,
  String? fcid,
  String? createDate,
  String? status,
  String? coverImage,
  String? uploadFile,
  String? documentType,
  dynamic certificationData,
  String? requestStatus,
  dynamic token,
  dynamic tokenGenerator,
  String? userType,
  String? connectedChatStatus,
}) => ListX(  userId: userId ?? _userId,
  userUniqueId: userUniqueId ?? _userUniqueId,
  userTypeId: userTypeId ?? _userTypeId,
  name: name ?? _name,
  lastName: lastName ?? _lastName,
  profileHeadline: profileHeadline ?? _profileHeadline,
  profileTitle: profileTitle ?? _profileTitle,
  birthDate: birthDate ?? _birthDate,
  email: email ?? _email,
  phoneNo: phoneNo ?? _phoneNo,
  password: password ?? _password,
  profileImage: profileImage ?? _profileImage,
  location: location ?? _location,
  city: city ?? _city,
  gender: gender ?? _gender,
  skills: skills ?? _skills,
  referralCode: referralCode ?? _referralCode,
  fcid: fcid ?? _fcid,
  createDate: createDate ?? _createDate,
  status: status ?? _status,
  coverImage: coverImage ?? _coverImage,
  uploadFile: uploadFile ?? _uploadFile,
  documentType: documentType ?? _documentType,
  certificationData: certificationData ?? _certificationData,
  requestStatus: requestStatus ?? _requestStatus,
  token: token ?? _token,
  tokenGenerator: tokenGenerator ?? _tokenGenerator,
  userType: userType ?? _userType,
  connectedChatStatus: connectedChatStatus ?? _connectedChatStatus,
);
  String? get userId => _userId;
  String? get userUniqueId => _userUniqueId;
  String? get userTypeId => _userTypeId;
  String? get name => _name;
  String? get lastName => _lastName;
  String? get profileHeadline => _profileHeadline;
  String? get profileTitle => _profileTitle;
  dynamic get birthDate => _birthDate;
  String? get email => _email;
  String? get phoneNo => _phoneNo;
  String? get password => _password;
  String? get profileImage => _profileImage;
  String? get location => _location;
  String? get city => _city;
  String? get gender => _gender;
  String? get skills => _skills;
  String? get referralCode => _referralCode;
  String? get fcid => _fcid;
  String? get createDate => _createDate;
  String? get status => _status;
  String? get coverImage => _coverImage;
  String? get uploadFile => _uploadFile;
  String? get documentType => _documentType;
  dynamic get certificationData => _certificationData;
  String? get requestStatus => _requestStatus;
  dynamic get token => _token;
  dynamic get tokenGenerator => _tokenGenerator;
  String? get userType => _userType;
  String? get connectedChatStatus => _connectedChatStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['user_unique_id'] = _userUniqueId;
    map['user_type_id'] = _userTypeId;
    map['name'] = _name;
    map['last_name'] = _lastName;
    map['profile_headline'] = _profileHeadline;
    map['profile_title'] = _profileTitle;
    map['birth_date'] = _birthDate;
    map['email'] = _email;
    map['phone_no'] = _phoneNo;
    map['password'] = _password;
    map['profile_image'] = _profileImage;
    map['location'] = _location;
    map['city'] = _city;
    map['gender'] = _gender;
    map['skills'] = _skills;
    map['referral_code'] = _referralCode;
    map['fcid'] = _fcid;
    map['create_date'] = _createDate;
    map['status'] = _status;
    map['cover_image'] = _coverImage;
    map['upload_file'] = _uploadFile;
    map['document_type'] = _documentType;
    map['certification_data'] = _certificationData;
    map['request_status'] = _requestStatus;
    map['_token'] = _token;
    map['token_generator'] = _tokenGenerator;
    map['user_type'] = _userType;
    map['connected_chat_status'] = _connectedChatStatus;
    return map;
  }

}
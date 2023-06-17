/// status : true
/// msg : "Success"
/// job_list : [{"job_id":"50","job_unique_id":"NJB050","job_type":"Private job","job_title":"Hardwear networking","employment_type":"Full Time","position":"SR","company_name":"SCS Infotect","job_timing":"","location":"SCS Infotect","no_of_vacancy":"1","salary":"25000","salary_rate_type":"Month","jobs_description":"test job","attachment_file":"","experience_required":"minimum 1 year","education_required":"PG required","document_required":"PG Markshit","skills_required":"nolege about Hardwear networking","user_id":"69","company_logo":"https://developmentalphawizz.com/Nerdmine/public/upload/job_company_logo/dumy_logo.png","govt_job_external_link":"","status":"1","promoted":"1","promot_end_date":"2023-07-01","create_date":"2023-04-19 11:13:42","total_applicant":[{"user_id":"70","name":"pratik","email":"katariya12@gmail.com","phone_no":"1234567888"},{"user_id":"69","name":"pratik test 4","email":"pratiktest4@gmail.com","phone_no":"8717801212"}]}]

class JobAndApplicantsResponse {
  JobAndApplicantsResponse({
      bool? status, 
      String? msg, 
      List<JobList>? jobList,}){
    _status = status;
    _msg = msg;
    _jobList = jobList;
}

  JobAndApplicantsResponse.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    if (json['job_list'] != null) {
      _jobList = [];
      json['job_list'].forEach((v) {
        _jobList?.add(JobList.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _msg;
  List<JobList>? _jobList;
JobAndApplicantsResponse copyWith({  bool? status,
  String? msg,
  List<JobList>? jobList,
}) => JobAndApplicantsResponse(  status: status ?? _status,
  msg: msg ?? _msg,
  jobList: jobList ?? _jobList,
);
  bool? get status => _status;
  String? get msg => _msg;
  List<JobList>? get jobList => _jobList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_jobList != null) {
      map['job_list'] = _jobList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// job_id : "50"
/// job_unique_id : "NJB050"
/// job_type : "Private job"
/// job_title : "Hardwear networking"
/// employment_type : "Full Time"
/// position : "SR"
/// company_name : "SCS Infotect"
/// job_timing : ""
/// location : "SCS Infotect"
/// no_of_vacancy : "1"
/// salary : "25000"
/// salary_rate_type : "Month"
/// jobs_description : "test job"
/// attachment_file : ""
/// experience_required : "minimum 1 year"
/// education_required : "PG required"
/// document_required : "PG Markshit"
/// skills_required : "nolege about Hardwear networking"
/// user_id : "69"
/// company_logo : "https://developmentalphawizz.com/Nerdmine/public/upload/job_company_logo/dumy_logo.png"
/// govt_job_external_link : ""
/// status : "1"
/// promoted : "1"
/// promot_end_date : "2023-07-01"
/// create_date : "2023-04-19 11:13:42"
/// total_applicant : [{"user_id":"70","name":"pratik","email":"katariya12@gmail.com","phone_no":"1234567888"},{"user_id":"69","name":"pratik test 4","email":"pratiktest4@gmail.com","phone_no":"8717801212"}]

class JobList {
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
      String? createDate, 
      List<TotalApplicant>? totalApplicant,}){
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
    _totalApplicant = totalApplicant;
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
    if (json['total_applicant'] != null) {
      _totalApplicant = [];
      json['total_applicant'].forEach((v) {
        _totalApplicant?.add(TotalApplicant.fromJson(v));
      });
    }
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
  List<TotalApplicant>? _totalApplicant;
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
  List<TotalApplicant>? totalApplicant,
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
  totalApplicant: totalApplicant ?? _totalApplicant,
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
  List<TotalApplicant>? get totalApplicant => _totalApplicant;

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
    if (_totalApplicant != null) {
      map['total_applicant'] = _totalApplicant?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// user_id : "70"
/// name : "pratik"
/// email : "katariya12@gmail.com"
/// phone_no : "1234567888"

class TotalApplicant {
  TotalApplicant({
      String? userId, 
      String? name, 
      String? email, 
      String? phoneNo,}){
    _userId = userId;
    _name = name;
    _email = email;
    _phoneNo = phoneNo;
}

  TotalApplicant.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _phoneNo = json['phone_no'];
  }
  String? _userId;
  String? _name;
  String? _email;
  String? _phoneNo;
TotalApplicant copyWith({  String? userId,
  String? name,
  String? email,
  String? phoneNo,
}) => TotalApplicant(  userId: userId ?? _userId,
  name: name ?? _name,
  email: email ?? _email,
  phoneNo: phoneNo ?? _phoneNo,
);
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get phoneNo => _phoneNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['phone_no'] = _phoneNo;
    return map;
  }

}
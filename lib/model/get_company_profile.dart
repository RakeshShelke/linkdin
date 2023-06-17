/// status : true
/// company_profile : {"bio":"","industary_type":" IT ","company_size":" 12","head_office":" Indore"}

class GetCompanyProfile {
  GetCompanyProfile({
      bool? status, 
      CompanyProfile? companyProfile,}){
    _status = status;
    _companyProfile = companyProfile;
}

  GetCompanyProfile.fromJson(dynamic json) {
    _status = json['status'];
    _companyProfile = json['company_profile'] != null ? CompanyProfile.fromJson(json['company_profile']) : null;
  }
  bool? _status;
  CompanyProfile? _companyProfile;
GetCompanyProfile copyWith({  bool? status,
  CompanyProfile? companyProfile,
}) => GetCompanyProfile(  status: status ?? _status,
  companyProfile: companyProfile ?? _companyProfile,
);
  bool? get status => _status;
  CompanyProfile? get companyProfile => _companyProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_companyProfile != null) {
      map['company_profile'] = _companyProfile?.toJson();
    }
    return map;
  }

}

/// bio : ""
/// industary_type : " IT "
/// company_size : " 12"
/// head_office : " Indore"

class CompanyProfile {
  CompanyProfile({
      String? bio, 
      String? industaryType, 
      String? companySize, 
      String? headOffice,}){
    _bio = bio;
    _industaryType = industaryType;
    _companySize = companySize;
    _headOffice = headOffice;
}

  CompanyProfile.fromJson(dynamic json) {
    _bio = json['bio'];
    _industaryType = json['industary_type'];
    _companySize = json['company_size'];
    _headOffice = json['head_office'];
  }
  String? _bio;
  String? _industaryType;
  String? _companySize;
  String? _headOffice;
CompanyProfile copyWith({  String? bio,
  String? industaryType,
  String? companySize,
  String? headOffice,
}) => CompanyProfile(  bio: bio ?? _bio,
  industaryType: industaryType ?? _industaryType,
  companySize: companySize ?? _companySize,
  headOffice: headOffice ?? _headOffice,
);
  String? get bio => _bio;
  String? get industaryType => _industaryType;
  String? get companySize => _companySize;
  String? get headOffice => _headOffice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bio'] = _bio;
    map['industary_type'] = _industaryType;
    map['company_size'] = _companySize;
    map['head_office'] = _headOffice;
    return map;
  }

}
/// status : true
/// search_data : []

class AllSearchResponse {
  AllSearchResponse({
      bool? status, 
      List<dynamic>? searchData,}){
    _status = status;
    _searchData = searchData;
}

  AllSearchResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['search_data'] != null) {
      _searchData = [];
      json['search_data'].forEach((v) {
        _searchData?.add(v);
      });
    }
  }
  bool? _status;
  List<dynamic>? _searchData;
AllSearchResponse copyWith({  bool? status,
  List<dynamic>? searchData,
}) => AllSearchResponse(  status: status ?? _status,
  searchData: searchData ?? _searchData,
);
  bool? get status => _status;
  List<dynamic>? get searchData => _searchData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_searchData != null) {
      map['search_data'] = _searchData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PaidBAModel {
  List<PaidBaList>? paidBaList;
  int? code;
  String? message;

  PaidBAModel({this.paidBaList, this.code, this.message});

  PaidBAModel.fromJson(Map<String, dynamic> json) {
    paidBaList = json["paidBAList"] == null ? null : (json["paidBAList"] as List).map((e) => PaidBaList.fromJson(e)).toList();
    code = json["code"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(paidBaList != null) {
      _data["paidBAList"] = paidBaList?.map((e) => e.toJson()).toList();
    }
    _data["code"] = code;
    _data["message"] = message;
    return _data;
  }
}

class PaidBaList {
  String? paidBaCode;
  String? status;

  PaidBaList({this.paidBaCode, this.status});

  PaidBaList.fromJson(Map<String, dynamic> json) {
    paidBaCode = json["paidBACode"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["paidBACode"] = paidBaCode;
    _data["status"] = status;
    return _data;
  }
}
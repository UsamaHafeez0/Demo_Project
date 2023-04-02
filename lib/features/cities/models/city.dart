class CityData {
  List<Data>? data;

  CityData({this.data});

  CityData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? countryId;
  int? stateId;

  Data({this.id, this.name, this.countryId, this.stateId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    return data;
  }
}
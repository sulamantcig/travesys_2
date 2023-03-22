class AirportResponseModel {
  String? id;
  bool? successful;
  String? message;
  String? messageCode;
  int? statusCode;
  List<AirPortModel>? data;
  String? startDate;
  String? endDate;
  int? total;
  int? failureLocation;
  int? failureType;
  int? pageSize;
  int? pageIndex;
  int? pageCount;

  AirportResponseModel(
      {this.id,
      this.successful,
      this.message,
      this.messageCode,
      this.statusCode,
      this.data,
      this.startDate,
      this.endDate,
      this.total,
      this.failureLocation,
      this.failureType,
      this.pageSize,
      this.pageIndex,
      this.pageCount});

  AirportResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    successful = json['successful'];
    message = json['message'];
    messageCode = json['messageCode'];
    statusCode = json['statusCode'];
    if (json['Data'] != null) {
      data = <AirPortModel>[];
      json['Data'].forEach((v) {
        data!.add(AirPortModel.fromJson(v));
      });
    }
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    total = json['Total'];
    failureLocation = json['failureLocation'];
    failureType = json['failureType'];
    pageSize = json['PageSize'];
    pageIndex = json['PageIndex'];
    pageCount = json['PageCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['successful'] = successful;
    data['message'] = message;
    data['messageCode'] = messageCode;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['StartDate'] = startDate;
    data['EndDate'] = endDate;
    data['Total'] = total;
    data['failureLocation'] = failureLocation;
    data['failureType'] = failureType;
    data['PageSize'] = pageSize;
    data['PageIndex'] = pageIndex;
    data['PageCount'] = pageCount;
    return data;
  }
}

class AirPortModel {
  String? uid;
  int? airportId;
  String? name;
  String? code;
  String? synonym;
  String? cityCode;
  String? cityName;
  double? lat;
  double? lon;
  int? rank;
  int? popularityRank;
  String? countryCode;
  String? countryName;
  List<String>? brandIds;
  String? languageCode;
  bool? isActive;
  OtherFields? otherFields;
  String? defaultName;
  String? defaultCityName;
  String? defaultCountryName;
  double? utcTimeDifference;
  bool? associatedCity;
  String? id;

  AirPortModel(
      {this.id,
      this.airportId,
      this.name,
      this.code,
      this.synonym,
      this.cityCode,
      this.cityName,
      this.lat,
      this.lon,
      this.rank,
      this.popularityRank,
      this.countryCode,
      this.countryName,
      this.brandIds,
      this.languageCode,
      this.isActive,
      this.otherFields,
      this.defaultName,
      this.defaultCityName,
      this.defaultCountryName,
      this.utcTimeDifference,
      this.associatedCity,
      this.uid});

  AirPortModel.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    airportId = json['airportId'];
    name = json['name'];
    code = json['code'];
    synonym = json['synonym'];
    cityCode = json['cityCode'];
    cityName = json['cityName'];
    lat = json['lat'];
    lon = json['lon'];
    rank = json['rank'];
    popularityRank = json['popularityRank'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    brandIds = json['brandIds'].cast<String>();
    languageCode = json['languageCode'];
    isActive = json['isActive'];
    otherFields = json['otherFields'] != null
        ? OtherFields.fromJson(json['otherFields'])
        : null;
    defaultName = json['defaultName'];
    defaultCityName = json['defaultCityName'];
    defaultCountryName = json['defaultCountryName'];
    utcTimeDifference = json['utcTimeDifference'];
    associatedCity = json['associatedCity'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['airportId'] = airportId;
    data['name'] = name;
    data['code'] = code;
    data['synonym'] = synonym;
    data['cityCode'] = cityCode;
    data['cityName'] = cityName;
    data['lat'] = lat;
    data['lon'] = lon;
    data['rank'] = rank;
    data['popularityRank'] = popularityRank;
    data['countryCode'] = countryCode;
    data['countryName'] = countryName;
    data['brandIds'] = brandIds;
    data['languageCode'] = languageCode;
    data['isActive'] = isActive;
    if (otherFields != null) {
      data['otherFields'] = otherFields!.toJson();
    }
    data['defaultName'] = defaultName;
    data['defaultCityName'] = defaultCityName;
    data['defaultCountryName'] = defaultCountryName;
    data['utcTimeDifference'] = utcTimeDifference;
    data['associatedCity'] = associatedCity;
    data['id'] = id;
    return data;
  }
}

class OtherFields {
  String? id;
  String? airportCitynameTArSa;
  String? airportCountrynameTArSa;
  String? airportNameTEnUs;
  String? airportCitynameTEnUs;
  String? airportCountrynameTEnUs;
  String? airportNameTArSa;

  OtherFields(
      {this.id,
      this.airportCitynameTArSa,
      this.airportCountrynameTArSa,
      this.airportNameTEnUs,
      this.airportCitynameTEnUs,
      this.airportCountrynameTEnUs,
      this.airportNameTArSa});

  OtherFields.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    airportCitynameTArSa = json['airport_cityname_t_ar_sa'];
    airportCountrynameTArSa = json['airport_countryname_t_ar_sa'];
    airportNameTEnUs = json['airport_name_t_en_us'];
    airportCitynameTEnUs = json['airport_cityname_t_en_us'];
    airportCountrynameTEnUs = json['airport_countryname_t_en_us'];
    airportNameTArSa = json['airport_name_t_ar_sa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['airport_cityname_t_ar_sa'] = airportCitynameTArSa;
    data['airport_countryname_t_ar_sa'] = airportCountrynameTArSa;
    data['airport_name_t_en_us'] = airportNameTEnUs;
    data['airport_cityname_t_en_us'] = airportCitynameTEnUs;
    data['airport_countryname_t_en_us'] = airportCountrynameTEnUs;
    data['airport_name_t_ar_sa'] = airportNameTArSa;
    return data;
  }
}

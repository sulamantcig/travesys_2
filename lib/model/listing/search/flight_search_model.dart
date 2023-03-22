class FlightSearchResponseModel {
  bool? successful;
  String? message;
  String? messageCode;
  int? statusCode;
  FlightSearchModel? data;
  String? startDate;
  String? endDate;
  int? failureLocation;
  int? failureType;

  FlightSearchResponseModel(
      {this.successful,
      this.message,
      this.messageCode,
      this.statusCode,
      this.data,
      this.startDate,
      this.endDate,
      this.failureLocation,
      this.failureType});

  FlightSearchResponseModel.fromJson(Map<String, dynamic> json) {
    successful = json['successful'];
    message = json['message'];
    messageCode = json['messageCode'];
    statusCode = json['statusCode'];
    data =
        json['Data'] != null ? FlightSearchModel.fromJson(json['Data']) : null;
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    failureLocation = json['failureLocation'];
    failureType = json['failureType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['successful'] = successful;
    data['message'] = message;
    data['messageCode'] = messageCode;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['StartDate'] = startDate;
    data['EndDate'] = endDate;
    data['failureLocation'] = failureLocation;
    data['failureType'] = failureType;
    return data;
  }
}

class FlightSearchModel {
  int? userId;
  String? userSessionId;
  String? cartId;
  String? searchId;
  List<Components>? components;
  int? status;
  String? errorCode;
  String? errorMessage;
  List<FlightSearchLegs>? flightSearchLegs;
  String? supportReferenceNumber;
  String? searchKey;

  FlightSearchModel(
      {this.userId,
      this.userSessionId,
      this.cartId,
      this.searchId,
      this.components,
      this.status,
      this.errorCode,
      this.errorMessage,
      this.flightSearchLegs,
      this.supportReferenceNumber,
      this.searchKey});

  FlightSearchModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userSessionId = json['userSessionId'];
    cartId = json['cartId'];
    searchId = json['searchId'];
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components!.add(Components.fromJson(v));
      });
    }
    status = json['status'];
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['flightSearchLegs'] != null) {
      flightSearchLegs = <FlightSearchLegs>[];
      json['flightSearchLegs'].forEach((v) {
        flightSearchLegs!.add(FlightSearchLegs.fromJson(v));
      });
    }
    supportReferenceNumber = json['supportReferenceNumber'];
    searchKey = json['searchKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userSessionId'] = userSessionId;
    data['cartId'] = cartId;
    data['searchId'] = searchId;
    if (components != null) {
      data['components'] = components!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    if (flightSearchLegs != null) {
      data['flightSearchLegs'] =
          flightSearchLegs!.map((v) => v.toJson()).toList();
    }
    data['supportReferenceNumber'] = supportReferenceNumber;
    data['searchKey'] = searchKey;
    return data;
  }
}

class Components {
  String? componentId;
  int? componentType;
  int? requestSequence;

  Components({this.componentId, this.componentType, this.requestSequence});

  Components.fromJson(Map<String, dynamic> json) {
    componentId = json['componentId'];
    componentType = json['componentType'];
    requestSequence = json['requestSequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['componentId'] = componentId;
    data['componentType'] = componentType;
    data['requestSequence'] = requestSequence;
    return data;
  }
}

class FlightSearchLegs {
  Null? flightId;
  int? originType;
  String? originCode;
  String? originName;
  String? originCity;
  String? originCityCode;
  String? originCountry;
  String? originCountryCode;
  int? destinationType;
  String? destinationCode;
  String? destinationName;
  String? destinationCity;
  String? destinationCityCode;
  String? destinationCountry;
  String? destinationCountryCode;
  int? classOfTravel;
  String? departureDate;

  FlightSearchLegs(
      {this.flightId,
      this.originType,
      this.originCode,
      this.originName,
      this.originCity,
      this.originCityCode,
      this.originCountry,
      this.originCountryCode,
      this.destinationType,
      this.destinationCode,
      this.destinationName,
      this.destinationCity,
      this.destinationCityCode,
      this.destinationCountry,
      this.destinationCountryCode,
      this.classOfTravel,
      this.departureDate});

  FlightSearchLegs.fromJson(Map<String, dynamic> json) {
    flightId = json['flightId'];
    originType = json['originType'];
    originCode = json['originCode'];
    originName = json['originName'];
    originCity = json['originCity'];
    originCityCode = json['originCityCode'];
    originCountry = json['originCountry'];
    originCountryCode = json['originCountryCode'];
    destinationType = json['destinationType'];
    destinationCode = json['destinationCode'];
    destinationName = json['destinationName'];
    destinationCity = json['destinationCity'];
    destinationCityCode = json['destinationCityCode'];
    destinationCountry = json['destinationCountry'];
    destinationCountryCode = json['destinationCountryCode'];
    classOfTravel = json['classOfTravel'];
    departureDate = json['departureDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flightId'] = flightId;
    data['originType'] = originType;
    data['originCode'] = originCode;
    data['originName'] = originName;
    data['originCity'] = originCity;
    data['originCityCode'] = originCityCode;
    data['originCountry'] = originCountry;
    data['originCountryCode'] = originCountryCode;
    data['destinationType'] = destinationType;
    data['destinationCode'] = destinationCode;
    data['destinationName'] = destinationName;
    data['destinationCity'] = destinationCity;
    data['destinationCityCode'] = destinationCityCode;
    data['destinationCountry'] = destinationCountry;
    data['destinationCountryCode'] = destinationCountryCode;
    data['classOfTravel'] = classOfTravel;
    data['departureDate'] = departureDate;
    return data;
  }
}

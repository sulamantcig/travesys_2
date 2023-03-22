class FlightListingResponse {
  bool? successful;
  String? message;
  String? messageCode;
  int? statusCode;
  FlightListing? data;
  String? startDate;
  String? endDate;
  int? failureLocation;
  int? failureType;

  FlightListingResponse(
      {this.successful,
      this.message,
      this.messageCode,
      this.statusCode,
      this.data,
      this.startDate,
      this.endDate,
      this.failureLocation,
      this.failureType});

  FlightListingResponse.fromJson(Map<String, dynamic> json) {
    successful = json['successful'];
    message = json['message'];
    messageCode = json['messageCode'];
    statusCode = json['statusCode'];
    data = json['Data'] != null ? FlightListing.fromJson(json['Data']) : null;
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

class FlightListing {
  List<AirItineraries>? airItineraries;
  double? cheapestFlightPrice;
  double? shortestFlightPrice;
  int? pageIndex;
  int? totalCount;
  int? totalPageCount;
  int? totalFilterCount;
  int? totalGroupedCount;
  int? pageSize;
  String? status;
  String? message;
  double? cacheExpiryTimeinSeconds;
  FlightSearchRequest? flightSearchRequest;

  FlightListing(
      {this.airItineraries,
      this.cheapestFlightPrice,
      this.shortestFlightPrice,
      this.pageIndex,
      this.totalCount,
      this.totalPageCount,
      this.totalFilterCount,
      this.totalGroupedCount,
      this.pageSize,
      this.status,
      this.message,
      this.cacheExpiryTimeinSeconds,
      this.flightSearchRequest});

  FlightListing.fromJson(Map<String, dynamic> json) {
    if (json['airItineraries'] != null) {
      airItineraries = <AirItineraries>[];
      json['airItineraries'].forEach((v) {
        airItineraries!.add(AirItineraries.fromJson(v));
      });
    }
    cheapestFlightPrice = json['cheapestFlightPrice'];
    shortestFlightPrice = json['shortestFlightPrice'];
    pageIndex = json['pageIndex'];
    totalCount = json['totalCount'];
    totalPageCount = json['totalPageCount'];
    totalFilterCount = json['totalFilterCount'];
    totalGroupedCount = json['totalGroupedCount'];
    pageSize = json['pageSize'];
    status = json['status'];
    message = json['message'];
    cacheExpiryTimeinSeconds = json['cacheExpiryTimeinSeconds'];
    flightSearchRequest = json['flightSearchRequest'] != null
        ? FlightSearchRequest.fromJson(json['flightSearchRequest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (airItineraries != null) {
      data['airItineraries'] = airItineraries!.map((v) => v.toJson()).toList();
    }
    data['cheapestFlightPrice'] = cheapestFlightPrice;
    data['shortestFlightPrice'] = shortestFlightPrice;
    data['pageIndex'] = pageIndex;
    data['totalCount'] = totalCount;
    data['totalPageCount'] = totalPageCount;
    data['totalFilterCount'] = totalFilterCount;
    data['totalGroupedCount'] = totalGroupedCount;
    data['pageSize'] = pageSize;
    data['status'] = status;
    data['message'] = message;
    data['cacheExpiryTimeinSeconds'] = cacheExpiryTimeinSeconds;
    if (flightSearchRequest != null) {
      data['flightSearchRequest'] = flightSearchRequest!.toJson();
    }
    return data;
  }
}

class AirItineraries {
  int? moreOptionsCount;
  double? totalFormattedPrice;
  List<Itineraries>? itineraries;

  AirItineraries(
      {this.moreOptionsCount, this.totalFormattedPrice, this.itineraries});

  AirItineraries.fromJson(Map<String, dynamic> json) {
    moreOptionsCount = json['moreOptionsCount'];
    totalFormattedPrice = json['totalFormattedPrice'];
    if (json['itineraries'] != null) {
      itineraries = <Itineraries>[];
      json['itineraries'].forEach((v) {
        itineraries!.add(Itineraries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['moreOptionsCount'] = moreOptionsCount;
    data['totalFormattedPrice'] = totalFormattedPrice;
    if (itineraries != null) {
      data['itineraries'] = itineraries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Itineraries {
  bool? notShowOnUI;
  String? itineraryIdentifier;
  int? noOfStops;
  double? points;
  String? currency;
  double? totalDiscountedPrice;
  double? totalDiscountedPoints;
  double? totalPoints;
  double? totalPrice;
  String? nonRefundableIndicator;
  String? engineType;
  bool? isSelected;
  double? commissionAmount;
  double? userBasedMarkupAmount;
  List<int>? totalJourneyTime;
  List<String>? departureTime;
  List<String>? arrivalTime;
  List<Legs>? legs;

  Itineraries(
      {this.notShowOnUI,
      this.itineraryIdentifier,
      this.noOfStops,
      this.points,
      this.currency,
      this.totalDiscountedPrice,
      this.totalDiscountedPoints,
      this.totalPoints,
      this.totalPrice,
      this.nonRefundableIndicator,
      this.engineType,
      this.isSelected,
      this.commissionAmount,
      this.userBasedMarkupAmount,
      this.totalJourneyTime,
      this.departureTime,
      this.arrivalTime,
      this.legs});

  Itineraries.fromJson(Map<String, dynamic> json) {
    notShowOnUI = json['notShowOnUI'];
    itineraryIdentifier = json['itineraryIdentifier'];
    noOfStops = json['noOfStops'];
    points = json['points'];
    currency = json['currency'];
    totalDiscountedPrice = json['totalDiscountedPrice'];
    totalDiscountedPoints = json['totalDiscountedPoints'];
    totalPoints = json['totalPoints'];
    totalPrice = json['totalPrice'];
    nonRefundableIndicator = json['nonRefundableIndicator'];
    engineType = json['engineType'];
    isSelected = json['isSelected'];
    commissionAmount = json['commissionAmount'];
    userBasedMarkupAmount = json['userBasedMarkupAmount'];
    totalJourneyTime = json['totalJourneyTime'].cast<int>();
    departureTime = json['departureTime'].cast<String>();
    arrivalTime = json['arrivalTime'].cast<String>();
    if (json['legs'] != null) {
      legs = <Legs>[];
      json['legs'].forEach((v) {
        legs!.add(Legs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notShowOnUI'] = notShowOnUI;
    data['itineraryIdentifier'] = itineraryIdentifier;
    data['noOfStops'] = noOfStops;
    data['points'] = points;
    data['currency'] = currency;
    data['totalDiscountedPrice'] = totalDiscountedPrice;
    data['totalDiscountedPoints'] = totalDiscountedPoints;
    data['totalPoints'] = totalPoints;
    data['totalPrice'] = totalPrice;
    data['nonRefundableIndicator'] = nonRefundableIndicator;
    data['engineType'] = engineType;
    data['isSelected'] = isSelected;
    data['commissionAmount'] = commissionAmount;
    data['userBasedMarkupAmount'] = userBasedMarkupAmount;
    data['totalJourneyTime'] = totalJourneyTime;
    data['departureTime'] = departureTime;
    data['arrivalTime'] = arrivalTime;
    if (legs != null) {
      data['legs'] = legs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Legs {
  bool? isLongLayover;
  bool? isRedEye;
  int? legOrder;
  String? departureTime;
  String? arrivalTime;
  int? layover;
  int? noOfStops;
  int? legJouneryTime;
  List<String>? stopAirportName;
  List<String>? stopCityName;
  List<String>? stopAirportCode;
  bool? isPlusOneNight;
  int? totalDaysCount;
  bool? isDomesticFlight;
  List<String>? airlines;
  Origin? origin;
  Origin? destination;
  List<Segments>? segments;

  List<Origin>? origins;
  List<Origin>? destinations;

  bool? isTimeSpecified;
  String? departureDate;
  int? timeWindow;
  int? segmentReference;
  Null? fareBasis;
  String? directionality;

  Legs({
    this.isLongLayover,
    this.isRedEye,
    this.legOrder,
    this.departureTime,
    this.arrivalTime,
    this.layover,
    this.noOfStops,
    this.legJouneryTime,
    this.stopAirportName,
    this.stopCityName,
    this.stopAirportCode,
    this.isPlusOneNight,
    this.totalDaysCount,
    this.isDomesticFlight,
    this.airlines,
    this.origin,
    this.destination,
    this.segments,
    this.isTimeSpecified,
    this.departureDate,
    this.timeWindow,
    this.segmentReference,
    this.fareBasis,
    this.directionality,
  });

  Legs.fromJson(Map<String, dynamic> json) {
    isLongLayover = json['isLongLayover'];
    isRedEye = json['isRedEye'];
    legOrder = json['legOrder'];
    departureTime = json['departureTime'];
    arrivalTime = json['arrivalTime'];
    layover = json['layover'];
    noOfStops = json['noOfStops'];
    legJouneryTime = json['legJouneryTime'];
    if (json['stopAirportName'] != null &&
        json['stopAirportName'].length != 0) {
      stopAirportName = json['stopAirportName'].cast<String>();
    }
    if (json['stopCityName'] != null && json['stopCityName'].length != 0) {
      stopCityName = json['stopCityName'].cast<String>();
    }
    if (json['stopAirportCode'] != null &&
        json['stopAirportCode'].length != 0) {
      stopAirportCode = json['stopAirportCode'].cast<String>();
    }
    isPlusOneNight = json['isPlusOneNight'];
    totalDaysCount = json['totalDaysCount'];
    isDomesticFlight = json['isDomesticFlight'];
    if (json['airlines'] != null && json['airlines'].length != 0) {
      airlines = json['airlines'].cast<String>();
    }

    if (json['origin'] is List) {
      if (json['origin'] != null) {
        origins = <Origin>[];
        json['origin'].forEach((v) {
          origins!.add(Origin.fromJson(v));
        });
      }
    } else {
      origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    }

    if (json['destination'] is List) {
      if (json['destination'] != null) {
        destinations = <Origin>[];
        json['destination'].forEach((v) {
          destinations!.add(Origin.fromJson(v));
        });
      }
    } else {
      destination = json['destination'] != null
          ? Origin.fromJson(json['destination'])
          : null;
    }

    if (json['segments'] != null) {
      segments = <Segments>[];
      json['segments'].forEach((v) {
        segments!.add(Segments.fromJson(v));
      });
    }
    isTimeSpecified = json['isTimeSpecified'];
    departureDate = json['departureDate'];
    timeWindow = json['timeWindow'];
    segmentReference = json['segmentReference'];
    fareBasis = json['fareBasis'];
    directionality = json['directionality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isLongLayover'] = isLongLayover;
    data['isRedEye'] = isRedEye;
    data['legOrder'] = legOrder;
    data['departureTime'] = departureTime;
    data['arrivalTime'] = arrivalTime;
    data['layover'] = layover;
    data['noOfStops'] = noOfStops;
    data['legJouneryTime'] = legJouneryTime;
    data['stopAirportName'] = stopAirportName;
    data['stopCityName'] = stopCityName;
    data['stopAirportCode'] = stopAirportCode;
    data['isPlusOneNight'] = isPlusOneNight;
    data['totalDaysCount'] = totalDaysCount;
    data['isDomesticFlight'] = isDomesticFlight;
    data['airlines'] = airlines;
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    if (destination != null) {
      data['destination'] = destination!.toJson();
    }
    if (segments != null) {
      data['segments'] = segments!.map((v) => v.toJson()).toList();
    }
    data['isTimeSpecified'] = this.isTimeSpecified;
    data['departureDate'] = this.departureDate;
    data['timeWindow'] = this.timeWindow;
    data['segmentReference'] = this.segmentReference;
    data['fareBasis'] = this.fareBasis;
    data['directionality'] = this.directionality;
    return data;
  }
}

class Segments {
  String? marketingAirlineCode;
  String? operatingAirlineCode;
  String? flightNumber;
  String? destinationAirportName;
  int? layoverTime;
  String? airCraftType;
  String? resignBookingCode;
  String? bookingClass;
  String? departureTime;
  String? arrivalTime;
  String? operatingAirlineName;

  Segments(
      {this.marketingAirlineCode,
      this.operatingAirlineCode,
      this.flightNumber,
      this.destinationAirportName,
      this.layoverTime,
      this.airCraftType,
      this.resignBookingCode,
      this.bookingClass,
      this.departureTime,
      this.arrivalTime,
      this.operatingAirlineName});

  Segments.fromJson(Map<String, dynamic> json) {
    marketingAirlineCode = json['marketingAirlineCode'];
    operatingAirlineCode = json['operatingAirlineCode'];
    flightNumber = json['flightNumber'];
    destinationAirportName = json['destinationAirportName'];
    layoverTime = json['layoverTime'];
    airCraftType = json['airCraftType'];
    resignBookingCode = json['resignBookingCode'];
    bookingClass = json['bookingClass'];
    departureTime = json['departureTime'];
    arrivalTime = json['arrivalTime'];
    operatingAirlineName = json['operatingAirlineName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['marketingAirlineCode'] = marketingAirlineCode;
    data['operatingAirlineCode'] = operatingAirlineCode;
    data['flightNumber'] = flightNumber;
    data['destinationAirportName'] = destinationAirportName;
    data['layoverTime'] = layoverTime;
    data['airCraftType'] = airCraftType;
    data['resignBookingCode'] = resignBookingCode;
    data['bookingClass'] = bookingClass;
    data['departureTime'] = departureTime;
    data['arrivalTime'] = arrivalTime;
    data['operatingAirlineName'] = operatingAirlineName;
    return data;
  }
}

class FlightSearchRequest {
  int? siteId;
  int? channelId;
  int? classOfTravel;
  String? classOfTravelCode;
  Null? classOfTravelTranslation;
  List<Legs>? legs;
  int? tripTypes;
  Null? tripTypesTranslation;
  PaxDetail? paxDetail;
  List<Travelers>? travelers;
  bool? isNonStop;
  bool? includeNearbyAirports;
  Null? prefferedAirLines;
  bool? isDirectFlight;
  int? numberofSeatsRequested;
  String? cartId;
  String? airSearchId;
  String? searchSessionId;
  bool? isPackage;
  int? userId;
  String? searchKey;
  Null? couponCode;
  bool? isMetaApi;
  bool? isBot;
  Null? affiliateToken;
  String? userAgent;
  Null? skipPackageValidation;
  Null? isOfflineQuarantinePackage;
  Null? flightItineraries;
  Null? flightAncillaries;
  bool? isComplimentary;
  String? locale;
  String? countryCode;
  String? currency;
  int? deviceType;
  String? requestIpAddress;
  int? userType;
  String? salesChannel;
  Null? appVersionCode;
  int? deviceId;

  FlightSearchRequest(
      {this.siteId,
      this.channelId,
      this.classOfTravel,
      this.classOfTravelCode,
      this.classOfTravelTranslation,
      this.legs,
      this.tripTypes,
      this.tripTypesTranslation,
      this.paxDetail,
      this.travelers,
      this.isNonStop,
      this.includeNearbyAirports,
      this.prefferedAirLines,
      this.isDirectFlight,
      this.numberofSeatsRequested,
      this.cartId,
      this.airSearchId,
      this.searchSessionId,
      this.isPackage,
      this.userId,
      this.searchKey,
      this.couponCode,
      this.isMetaApi,
      this.isBot,
      this.affiliateToken,
      this.userAgent,
      this.skipPackageValidation,
      this.isOfflineQuarantinePackage,
      this.flightItineraries,
      this.flightAncillaries,
      this.isComplimentary,
      this.locale,
      this.countryCode,
      this.currency,
      this.deviceType,
      this.requestIpAddress,
      this.userType,
      this.salesChannel,
      this.appVersionCode,
      this.deviceId});

  FlightSearchRequest.fromJson(Map<String, dynamic> json) {
    siteId = json['siteId'];
    channelId = json['channelId'];
    classOfTravel = json['classOfTravel'];
    classOfTravelCode = json['classOfTravelCode'];
    classOfTravelTranslation = json['classOfTravelTranslation'];
    if (json['legs'] != null) {
      legs = <Legs>[];
      json['legs'].forEach((v) {
        legs!.add(Legs.fromJson(v));
      });
    }
    tripTypes = json['tripTypes'];
    tripTypesTranslation = json['tripTypesTranslation'];
    paxDetail = json['paxDetail'] != null
        ? PaxDetail.fromJson(json['paxDetail'])
        : null;
    if (json['travelers'] != null) {
      travelers = <Travelers>[];
      json['travelers'].forEach((v) {
        travelers!.add(Travelers.fromJson(v));
      });
    }
    isNonStop = json['isNonStop'];
    includeNearbyAirports = json['includeNearbyAirports'];
    prefferedAirLines = json['prefferedAirLines'];
    isDirectFlight = json['isDirectFlight'];
    numberofSeatsRequested = json['numberofSeatsRequested'];
    cartId = json['cartId'];
    airSearchId = json['airSearchId'];
    searchSessionId = json['searchSessionId'];
    isPackage = json['isPackage'];
    userId = json['userId'];
    searchKey = json['searchKey'];
    couponCode = json['couponCode'];
    isMetaApi = json['isMetaApi'];
    isBot = json['isBot'];
    affiliateToken = json['affiliateToken'];
    userAgent = json['userAgent'];
    skipPackageValidation = json['skipPackageValidation'];
    isOfflineQuarantinePackage = json['isOfflineQuarantinePackage'];
    flightItineraries = json['flightItineraries'];
    flightAncillaries = json['flightAncillaries'];
    isComplimentary = json['isComplimentary'];
    locale = json['locale'];
    countryCode = json['countryCode'];
    currency = json['currency'];
    deviceType = json['deviceType'];
    requestIpAddress = json['requestIpAddress'];
    userType = json['userType'];
    salesChannel = json['salesChannel'];
    appVersionCode = json['appVersionCode'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['siteId'] = siteId;
    data['channelId'] = channelId;
    data['classOfTravel'] = classOfTravel;
    data['classOfTravelCode'] = classOfTravelCode;
    data['classOfTravelTranslation'] = classOfTravelTranslation;
    if (legs != null) {
      data['legs'] = legs!.map((v) => v.toJson()).toList();
    }
    data['tripTypes'] = tripTypes;
    data['tripTypesTranslation'] = tripTypesTranslation;
    if (paxDetail != null) {
      data['paxDetail'] = paxDetail!.toJson();
    }
    if (travelers != null) {
      data['travelers'] = travelers!.map((v) => v.toJson()).toList();
    }
    data['isNonStop'] = isNonStop;
    data['includeNearbyAirports'] = includeNearbyAirports;
    data['prefferedAirLines'] = prefferedAirLines;
    data['isDirectFlight'] = isDirectFlight;
    data['numberofSeatsRequested'] = numberofSeatsRequested;
    data['cartId'] = cartId;
    data['airSearchId'] = airSearchId;
    data['searchSessionId'] = searchSessionId;
    data['isPackage'] = isPackage;
    data['userId'] = userId;
    data['searchKey'] = searchKey;
    data['couponCode'] = couponCode;
    data['isMetaApi'] = isMetaApi;
    data['isBot'] = isBot;
    data['affiliateToken'] = affiliateToken;
    data['userAgent'] = userAgent;
    data['skipPackageValidation'] = skipPackageValidation;
    data['isOfflineQuarantinePackage'] = isOfflineQuarantinePackage;
    data['flightItineraries'] = flightItineraries;
    data['flightAncillaries'] = flightAncillaries;
    data['isComplimentary'] = isComplimentary;
    data['locale'] = locale;
    data['countryCode'] = countryCode;
    data['currency'] = currency;
    data['deviceType'] = deviceType;
    data['requestIpAddress'] = requestIpAddress;
    data['userType'] = userType;
    data['salesChannel'] = salesChannel;
    data['appVersionCode'] = appVersionCode;
    data['deviceId'] = deviceId;
    return data;
  }
}

class Origin {
  String? countryName;
  String? countryCode;
  String? code;
  String? name;
  String? displayName;
  String? nameTranslation;
  String? cityCode;
  String? cityName;
  String? cityNameTranslation;
  String? type;
  bool? primarySearch;
  String? airportName;
  String? airportCode;

  Origin(
      {this.countryName,
      this.countryCode,
      this.code,
      this.name,
      this.displayName,
      this.nameTranslation,
      this.cityCode,
      this.cityName,
      this.cityNameTranslation,
      this.type,
      this.primarySearch,
      this.airportName,
      this.airportCode});

  Origin.fromJson(Map<String, dynamic> json) {
    airportCode = json['airportCode'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    code = json['code'];
    name = json['name'];
    displayName = json['displayName'];
    nameTranslation = json['nameTranslation'];
    cityCode = json['cityCode'];
    cityName = json['cityName'];
    cityNameTranslation = json['cityNameTranslation'];
    type = json['type'];
    primarySearch = json['primarySearch'];
    airportName = json['airportName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countryName'] = this.countryName;
    data['countryCode'] = this.countryCode;
    data['code'] = this.code;
    data['name'] = this.name;
    data['displayName'] = this.displayName;
    data['nameTranslation'] = this.nameTranslation;
    data['cityCode'] = this.cityCode;
    data['cityName'] = cityName;
    data['cityNameTranslation'] = this.cityNameTranslation;
    data['type'] = this.type;
    data['primarySearch'] = this.primarySearch;
    data['airportName'] = airportName;
    data['airportCode'] = airportCode;
    return data;
  }
}

class PaxDetail {
  List<PaxDetails>? paxDetails;
  int? noOfAdult;
  int? noOfSenior;
  int? noOfChild;
  int? noOfInfantOnLap;
  int? noOfInfantOnSeat;

  PaxDetail(
      {this.paxDetails,
      this.noOfAdult,
      this.noOfSenior,
      this.noOfChild,
      this.noOfInfantOnLap,
      this.noOfInfantOnSeat});

  PaxDetail.fromJson(Map<String, dynamic> json) {
    if (json['paxDetails'] != null) {
      paxDetails = <PaxDetails>[];
      json['paxDetails'].forEach((v) {
        paxDetails!.add(PaxDetails.fromJson(v));
      });
    }
    noOfAdult = json['noOfAdult'];
    noOfSenior = json['noOfSenior'];
    noOfChild = json['noOfChild'];
    noOfInfantOnLap = json['noOfInfantOnLap'];
    noOfInfantOnSeat = json['noOfInfantOnSeat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paxDetails != null) {
      data['paxDetails'] = paxDetails!.map((v) => v.toJson()).toList();
    }
    data['noOfAdult'] = noOfAdult;
    data['noOfSenior'] = noOfSenior;
    data['noOfChild'] = noOfChild;
    data['noOfInfantOnLap'] = noOfInfantOnLap;
    data['noOfInfantOnSeat'] = noOfInfantOnSeat;
    return data;
  }
}

class PaxDetails {
  int? paxType;

  PaxDetails({this.paxType});

  PaxDetails.fromJson(Map<String, dynamic> json) {
    paxType = json['paxType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paxType'] = paxType;
    return data;
  }
}

class Travelers {
  int? adults;
  int? seniors;
  List<Null>? children;
  List<Null>? infants;

  Travelers({this.adults, this.seniors, this.children, this.infants});

  Travelers.fromJson(Map<String, dynamic> json) {
    adults = json['adults'];
    seniors = json['seniors'];
    if (json['children'] != null) {
      children = <Null>[];
      json['children'].forEach((v) {
        // children!.add(Null.fromJson(v));
      });
    }
    if (json['infants'] != null) {
      infants = <Null>[];
      json['infants'].forEach((v) {
        // infants!.add(Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adults'] = adults;
    data['seniors'] = seniors;
    if (children != null) {
      // data['children'] = children!.map((v) => v.toJson()).toList();
    }
    if (infants != null) {
      // data['infants'] = infants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

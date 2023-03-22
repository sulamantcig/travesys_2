import 'dart:convert';
import 'dart:io';
import 'package:travesys_2/model/airports/airports_model.dart';
import 'package:travesys_2/model/auth/guest_model.dart';
import 'package:travesys_2/model/listing/search/flight_search_model.dart';
import 'package:travesys_2/ui/listing/flight_listing_view.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/cart/cart_comp_response.dart';
import '../model/listing/listing/flight_listing_model.dart';

class Api {
  static final Api _singleton = Api._internal();
  static Api get instance => _singleton;

  final _baseUrl = 'https://preprodgateway.holidaysbysaudia.com';
  final _version = 'api/v1';

  DateTime? startDate;
  DateTime? endDate;
  AirPortModel? origin;
  AirPortModel? destination;

  LoggedInResponseModel _userModel = LoggedInResponseModel();
  CartResponseModel _cartResponseModel = CartResponseModel();

  var _headers = {
    'x-brandid': '3',
    'x-channelid': '55',
    'x-locale': 'en-US',
    'x-url': 'iOS_Mobile_Application',
    'x-ip': '192.168.3.158',
    'x-requestid': const Uuid().v4(),
    'Accept': 'application/json',
    'Content-Type': 'application/json-patch+json',
    'Accept-Language': 'en',
  };

  factory Api() {
    return _singleton;
  }

  Api._internal();

  Future<void> createGuestUser() async {
    var client = http.Client();
    final body = jsonEncode({
      "siteId": 3,
      "countryCode": "SA",
      "locale": "en-US",
      "deviceType": "IOS",
      "devicetoken": "",
      "currencyCode": "SAR"
    });
    try {
      var url = '$_baseUrl/identity/$_version/auth/account/CreateGuestUser';
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: _headers,
      );
      _userModel = LoggedInResponseModel.fromJson(jsonDecode(response.body));
      if (kDebugMode) {
        print(_userModel);
      }
      // return loginResult;
    } finally {
      client.close();
    }
  }

  Future<List<AirPortModel>> getAirportList(String? airportName) async {
    var client = http.Client();
    final queryParameters = {
      'languageCode': 'en-US',
      'pageIndex': '0',
      'pageSize': '10',
      'searchParam': airportName
    };
    _headers['token'] = _userModel.data?.token ?? "";
    try {
      final uri = Uri.https(
        'preprodgateway.holidaysbysaudia.com',
        '/setting/$_version/Airport/GetAirportList',
        queryParameters,
      );
      final response = await http.get(
        uri,
        headers: _headers,
      );
      AirportResponseModel airPortResponse =
          AirportResponseModel.fromJson(jsonDecode(response.body));
      if (kDebugMode) {
        print(airPortResponse);
      }
      return airPortResponse.data ?? [];
    } finally {
      client.close();
    }
  }

  Future<void> getCartComponent() async {
    var userId = _userModel.data?.profile?.id;
    var client = http.Client();
    _headers.addAll({'Authorization': 'Bearer ${_userModel.data?.token}'});
    try {
      // {{url}}/onlinebooking/{{version}}/cart/getonlinecart/
      final uri = Uri.https(
        'preprodgateway.holidaysbysaudia.com',
        '/onlinebooking/$_version/cart/getonlinecart/$userId',
      );
      final response = await http.get(
        uri,
        headers: _headers,
      );
      _cartResponseModel =
          CartResponseModel.fromJson(jsonDecode(response.body));
      // return cartResponseModel;
    } finally {
      client.close();
    }
  }

  Future<FlightListing?> flightSearch({int page = 1}) async {
    await getCartComponent();
    // var foramt
    var requestMeta = jsonEncode({
      "includeNearByAirports": false,
      "tripType": 2,
      "travelers": {"Adults": 1, "Children": [], "Infants": []},
      "legs": [
        {
          "Origin": {
            "code": origin?.code,
            "name": origin?.name,
            "countryCode": origin?.countryCode,
            "countryName": origin?.countryName,
            "displayName":
                '${origin?.countryName} - ${origin?.cityName}(${origin?.code})',
            "cityCode": origin?.cityCode,
            "cityName": origin?.cityName,
            "primarySearch": true,
            "type": "Airport",
            "lat": origin?.lat.toString(),
            "lon": origin?.lon.toString(),
          },
          "Destination": {
            "code": destination?.code,
            "name": destination?.name,
            "countryCode": destination?.countryCode,
            "countryName": destination?.countryName,
            "displayName":
                '${destination?.countryName} - ${destination?.cityName}(${destination?.code})',
            "cityCode": destination?.cityCode,
            "cityName": destination?.cityName,
            "primarySearch": true,
            "type": "Airport",
            "lat": destination?.lat.toString(),
            "lon": destination?.lon.toString(),
          },
          "DepartureDate": startDate?.toIso8601String(),
        },
        {
          "Origin": {
            "code": destination?.code,
            "name": destination?.name,
            "countryCode": destination?.countryCode,
            "countryName": destination?.countryName,
            "displayName":
                '${destination?.countryName} - ${destination?.cityName}(${destination?.code})',
            "cityCode": destination?.cityCode,
            "cityName": destination?.cityName,
            "primarySearch": true,
            "type": "Airport",
            "lat": destination?.lat.toString(),
            "lon": destination?.lon.toString(),
          },
          "Destination": {
            "code": origin?.code,
            "name": origin?.name,
            "countryCode": origin?.countryCode,
            "countryName": origin?.countryName,
            "displayName":
                '${origin?.countryName} - ${origin?.cityName}(${origin?.code})',
            "cityCode": origin?.cityCode,
            "cityName": origin?.cityName,
            "primarySearch": true,
            "type": "Airport",
            "lat": origin?.lat.toString(),
            "lon": origin?.lon.toString(),
          },
          "DepartureDate": endDate?.toIso8601String(),
        }
      ],
      "advanceOptions": {"preferredClass": "Economy", "IsNonStop": false},
      "ClassOfTravel": "Economy",
      "quotationType": "Flight",
      "language": "en-US",
      "navigateUrl":
          "/bookingflow/flightListing/${origin?.code}-${destination?.code}/2023-03-21/2023-03-22/Economy/1adult",
      "groupId": _cartResponseModel.groupId,
      "customerDetails": {
        "userId": _cartResponseModel.userId,
        "userSessionId": _cartResponseModel.userSessionId,
      },
      "userDetails": {
        "countryCode": "BH",
        "nationality": null,
        "emailAddress": "",
        "fullName": "",
        "isRegistered": false,
        "mobileNumber": "",
        "phoneNumber": "",
        "userId": _cartResponseModel.userId,
        "userName": _userModel.data?.profile?.userName,
        "username": _userModel.data?.profile?.userName,
        "locale": "en-US",
        "userType": "GuestUsers"
      },
      "RequestMeta": {
        "cartType": "Standalone",
        "userSessionId": _cartResponseModel.userSessionId,
        "cartId": _cartResponseModel.cartId,
        "searchGuidId": "8d77f940-ce11-48d6-9a4b-7630ae40294d",
        "groupId": _cartResponseModel.groupId,
        "supportReferenceNumber": _cartResponseModel.supportReferenceNumber,
        "userId": _userModel.data?.profile?.id,
        "username": _userModel.data?.profile?.userName,
        "userAgent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
        "utmSource": "WEB",
        "utmCampaign": null,
        "utmCampaignMedium": null,
        "deviceId": 1,
        "currency": "SAR",
        "salesChannel": "web",
        "locale": "en-US",
        "activityId": null,
        "siteId": "232",
        "ipAddress": "88.201.24.198",
        "countryCode": "SA",
        "userType": 1,
        "searchType": "Flight",
        "language": "en-US",
        "promoCode": null
      }
    });
    var client = http.Client();
    try {
      var url = '$_baseUrl/flight/$_version/search/flightsearch';
      var response = await http.post(
        Uri.parse(url),
        body: requestMeta,
        headers: _headers,
      );
      var flightSearchResponse =
          FlightSearchResponseModel.fromJson(jsonDecode(response.body));
      var listing = await getflightListing(flightSearchResponse, page: page);
      if (kDebugMode) {
        print(flightSearchResponse);
      }
      return listing;
    } finally {
      client.close();
    }
  }

  Future<FlightListing?> getflightListing(FlightSearchResponseModel? request,
      {int page = 1}) async {
    var componentId = request?.data?.components?.first.componentId;
    var searchKey = request?.data?.searchKey;
    var requestMeta = jsonEncode({
      "IsFlightGrouping": true,
      "IsResetFilter": false,
      "cacheKey": searchKey,
      "componentId": componentId,
      "componentType": 1,
      "userId": "66453193",
    });
    var client = http.Client();
    try {
      var url =
          '$_baseUrl/flight/$_version/itinerary/GetFlightList?filters=&sorts=&page=$page&pageSize=10';
      var response = await http.post(
        Uri.parse(url),
        body: requestMeta,
        headers: _headers,
      );
      FlightListingResponse flightSearchResponse =
          FlightListingResponse.fromJson(jsonDecode(response.body));
      if (kDebugMode) {
        print(flightSearchResponse);
      }
      return flightSearchResponse.data;
    } finally {
      client.close();
    }
  }

  // Future<http.Response?> fetchFlights() async {
  //   var client = http.Client();
  //   try {
  //     var response = await client.post(
  //         Uri.https('example.com', 'whatsit/create'),
  //         body: {'name': 'doodle', 'color': 'blue'});
  //     var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //     var uri = Uri.parse(decodedResponse['uri'] as String);
  //     if (kDebugMode) {
  //       print(await client.get(uri));
  //     }
  //     return decodedResponse;
  //   } finally {
  //     client.close();
  //   }
  //   return null;
  // }
}

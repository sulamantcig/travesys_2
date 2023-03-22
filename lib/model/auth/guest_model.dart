class LoggedInResponseModel {
  String? id;
  bool? successful;
  String? message;
  String? messageCode;
  int? statusCode;
  Data? data;

  LoggedInResponseModel(
      {this.id,
      this.successful,
      this.message,
      this.messageCode,
      this.statusCode,
      this.data});

  LoggedInResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    successful = json['successful'];
    message = json['message'];
    messageCode = json['messageCode'];
    statusCode = json['statusCode'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['successful'] = successful;
    data['message'] = message;
    data['messageCode'] = messageCode;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? iid;
  String? id;
  Profile? profile;
  String? token;
  String? expiry;
  bool? isAgencyUpdateRequired;
  bool? shouldSetPassword;
  Null? activationToken;
  String? expiryString;

  Data(
      {this.id,
      this.profile,
      this.token,
      this.expiry,
      this.isAgencyUpdateRequired,
      this.shouldSetPassword,
      this.activationToken,
      this.expiryString});

  Data.fromJson(Map<String, dynamic> json) {
    iid = json['\$id'];
    id = json['id'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    token = json['token'];
    expiry = json['expiry'];
    isAgencyUpdateRequired = json['isAgencyUpdateRequired'];
    shouldSetPassword = json['shouldSetPassword'];
    activationToken = json['activationToken'];
    expiryString = json['expiryString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    data['token'] = token;
    data['expiry'] = expiry;
    data['isAgencyUpdateRequired'] = isAgencyUpdateRequired;
    data['shouldSetPassword'] = shouldSetPassword;
    data['activationToken'] = activationToken;
    data['expiryString'] = expiryString;
    return data;
  }
}

class Profile {
  String? Uid;
  Null? firstName;
  Null? lastName;
  String? userName;
  Null? email;
  String? locale;
  String? countryCode;
  String? currencyCode;
  Null? communicationLanguage;
  Null? phoneNumber;
  int? id;
  String? customerId;
  bool? status;
  Null? userProfilePics;
  bool? isBlocked;
  String? userType;
  String? customerType;
  String? aquiredOn;
  Null? registeredOn;
  Null? birthDate;
  int? siteId;
  int? pin;
  Null? profileUrl;
  Null? socialNetwork;
  Null? registrationSource;
  Null? phoneCountryCode;
  Null? phoneDiallingCode;
  Null? displayName;
  int? preferredStarRating;
  String? smokingPreference;
  bool? facilitiesForDisabled;
  bool? onlySelfBooking;
  bool? onlyOthersBooking;
  bool? selfandOtherBookings;
  bool? hasPassword;
  Null? prefferedLanguage;
  bool? isEmailPreffered;
  bool? isPushNotificationPreffered;
  bool? isSMSPreffered;
  bool? isSocialNetworkConnected;
  bool? emailConfirmed;
  Null? remark;
  Null? agencyName;
  Null? identificationNo;
  Null? accountNumber;
  int? countryId;
  int? cityId;
  Null? occupation;
  Null? agencyAddress;
  Null? agencyPhoneDiallingCode;
  Null? agencyPhoneNumber;
  Null? agencyEmail;
  Null? socialNetworks;
  String? fullName;
  Null? nationalId;
  Null? membershipId;
  Null? cif;
  List<Null>? communicationSettings;
  List<Null>? userPassengers;
  List<Null>? userCards;
  List<Null>? userPrefferedFacilities;
  Null? loyaltyDetails;
  Null? activeCount;
  Null? inActiveCount;
  Null? blockedCount;
  Null? agencyCount;
  Null? pendingAgencyCount;
  String? maritalStatus;
  String? gender;
  bool? isPreRegistered;
  Null? passportNumber;
  int? userFunctionalRole;
  Null? pointsFrozen;
  Null? frozenCount;
  Null? isOTPVerified;
  Null? unFreezeReason;
  Null? freezeReason;
  List<Null>? loyaltyPrograms;

  Profile(
      {this.Uid,
      this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.locale,
      this.countryCode,
      this.currencyCode,
      this.communicationLanguage,
      this.phoneNumber,
      this.id,
      this.customerId,
      this.status,
      this.userProfilePics,
      this.isBlocked,
      this.userType,
      this.customerType,
      this.aquiredOn,
      this.registeredOn,
      this.birthDate,
      this.siteId,
      this.pin,
      this.profileUrl,
      this.socialNetwork,
      this.registrationSource,
      this.phoneCountryCode,
      this.phoneDiallingCode,
      this.displayName,
      this.preferredStarRating,
      this.smokingPreference,
      this.facilitiesForDisabled,
      this.onlySelfBooking,
      this.onlyOthersBooking,
      this.selfandOtherBookings,
      this.hasPassword,
      this.prefferedLanguage,
      this.isEmailPreffered,
      this.isPushNotificationPreffered,
      this.isSMSPreffered,
      this.isSocialNetworkConnected,
      this.emailConfirmed,
      this.remark,
      this.agencyName,
      this.identificationNo,
      this.accountNumber,
      this.countryId,
      this.cityId,
      this.occupation,
      this.agencyAddress,
      this.agencyPhoneDiallingCode,
      this.agencyPhoneNumber,
      this.agencyEmail,
      this.socialNetworks,
      this.fullName,
      this.nationalId,
      this.membershipId,
      this.cif,
      this.communicationSettings,
      this.userPassengers,
      this.userCards,
      this.userPrefferedFacilities,
      this.loyaltyDetails,
      this.activeCount,
      this.inActiveCount,
      this.blockedCount,
      this.agencyCount,
      this.pendingAgencyCount,
      this.maritalStatus,
      this.gender,
      this.isPreRegistered,
      this.passportNumber,
      this.userFunctionalRole,
      this.pointsFrozen,
      this.frozenCount,
      this.isOTPVerified,
      this.unFreezeReason,
      this.freezeReason,
      this.loyaltyPrograms});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json["\$id'"];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    email = json['email'];
    locale = json['locale'];
    countryCode = json['countryCode'];
    currencyCode = json['currencyCode'];
    communicationLanguage = json['communicationLanguage'];
    phoneNumber = json['phoneNumber'];
    id = json['id'];
    customerId = json['customerId'];
    status = json['status'];
    userProfilePics = json['userProfilePics'];
    isBlocked = json['isBlocked'];
    userType = json['userType'];
    customerType = json['customerType'];
    aquiredOn = json['aquiredOn'];
    registeredOn = json['registeredOn'];
    birthDate = json['birthDate'];
    siteId = json['siteId'];
    pin = json['pin'];
    profileUrl = json['profileUrl'];
    socialNetwork = json['socialNetwork'];
    registrationSource = json['registrationSource'];
    phoneCountryCode = json['phoneCountryCode'];
    phoneDiallingCode = json['phoneDiallingCode'];
    displayName = json['displayName'];
    preferredStarRating = json['preferredStarRating'];
    smokingPreference = json['smokingPreference'];
    facilitiesForDisabled = json['facilitiesForDisabled'];
    onlySelfBooking = json['onlySelfBooking'];
    onlyOthersBooking = json['onlyOthersBooking'];
    selfandOtherBookings = json['selfandOtherBookings'];
    hasPassword = json['hasPassword'];
    prefferedLanguage = json['prefferedLanguage'];
    isEmailPreffered = json['isEmailPreffered'];
    isPushNotificationPreffered = json['isPushNotificationPreffered'];
    isSMSPreffered = json['isSMSPreffered'];
    isSocialNetworkConnected = json['isSocialNetworkConnected'];
    emailConfirmed = json['emailConfirmed'];
    remark = json['remark'];
    agencyName = json['agencyName'];
    identificationNo = json['identificationNo'];
    accountNumber = json['accountNumber'];
    countryId = json['countryId'];
    cityId = json['cityId'];
    occupation = json['occupation'];
    agencyAddress = json['agencyAddress'];
    agencyPhoneDiallingCode = json['agencyPhoneDiallingCode'];
    agencyPhoneNumber = json['agencyPhoneNumber'];
    agencyEmail = json['agencyEmail'];
    socialNetworks = json['socialNetworks'];
    fullName = json['fullName'];
    nationalId = json['nationalId'];
    membershipId = json['membershipId'];
    cif = json['cif'];
    if (json['communicationSettings'] != null) {
      communicationSettings = <Null>[];
      json['communicationSettings'].forEach((v) {
        // communicationSettings!.add(new Null.fromJson(v));
      });
    }
    if (json['userPassengers'] != null) {
      userPassengers = <Null>[];
      json['userPassengers'].forEach((v) {
        // userPassengers!.add(new Null.fromJson(v));
      });
    }
    if (json['userCards'] != null) {
      userCards = <Null>[];
      json['userCards'].forEach((v) {
        // userCards!.add(new Null.fromJson(v));
      });
    }
    if (json['userPrefferedFacilities'] != null) {
      userPrefferedFacilities = <Null>[];
      json['userPrefferedFacilities'].forEach((v) {
        // userPrefferedFacilities!.add(new Null.fromJson(v));
      });
    }
    loyaltyDetails = json['loyaltyDetails'];
    activeCount = json['activeCount'];
    inActiveCount = json['inActiveCount'];
    blockedCount = json['blockedCount'];
    agencyCount = json['agencyCount'];
    pendingAgencyCount = json['pendingAgencyCount'];
    maritalStatus = json['maritalStatus'];
    gender = json['gender'];
    isPreRegistered = json['isPreRegistered'];
    passportNumber = json['passportNumber'];
    userFunctionalRole = json['userFunctionalRole'];
    pointsFrozen = json['pointsFrozen'];
    frozenCount = json['frozenCount'];
    isOTPVerified = json['isOTPVerified'];
    unFreezeReason = json['unFreezeReason'];
    freezeReason = json['freezeReason'];
    if (json['loyaltyPrograms'] != null) {
      loyaltyPrograms = <Null>[];
      json['loyaltyPrograms'].forEach((v) {
        // loyaltyPrograms!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['email'] = email;
    data['locale'] = locale;
    data['countryCode'] = countryCode;
    data['currencyCode'] = currencyCode;
    data['communicationLanguage'] = communicationLanguage;
    data['phoneNumber'] = phoneNumber;
    data['id'] = id;
    data['customerId'] = customerId;
    data['status'] = status;
    data['userProfilePics'] = userProfilePics;
    data['isBlocked'] = isBlocked;
    data['userType'] = userType;
    data['customerType'] = customerType;
    data['aquiredOn'] = aquiredOn;
    data['registeredOn'] = registeredOn;
    data['birthDate'] = birthDate;
    data['siteId'] = siteId;
    data['pin'] = pin;
    data['profileUrl'] = profileUrl;
    data['socialNetwork'] = socialNetwork;
    data['registrationSource'] = registrationSource;
    data['phoneCountryCode'] = phoneCountryCode;
    data['phoneDiallingCode'] = phoneDiallingCode;
    data['displayName'] = displayName;
    data['preferredStarRating'] = preferredStarRating;
    data['smokingPreference'] = smokingPreference;
    data['facilitiesForDisabled'] = facilitiesForDisabled;
    data['onlySelfBooking'] = onlySelfBooking;
    data['onlyOthersBooking'] = onlyOthersBooking;
    data['selfandOtherBookings'] = selfandOtherBookings;
    data['hasPassword'] = hasPassword;
    data['prefferedLanguage'] = prefferedLanguage;
    data['isEmailPreffered'] = isEmailPreffered;
    data['isPushNotificationPreffered'] = isPushNotificationPreffered;
    data['isSMSPreffered'] = isSMSPreffered;
    data['isSocialNetworkConnected'] = isSocialNetworkConnected;
    data['emailConfirmed'] = emailConfirmed;
    data['remark'] = remark;
    data['agencyName'] = agencyName;
    data['identificationNo'] = identificationNo;
    data['accountNumber'] = accountNumber;
    data['countryId'] = countryId;
    data['cityId'] = cityId;
    data['occupation'] = occupation;
    data['agencyAddress'] = agencyAddress;
    data['agencyPhoneDiallingCode'] = agencyPhoneDiallingCode;
    data['agencyPhoneNumber'] = agencyPhoneNumber;
    data['agencyEmail'] = agencyEmail;
    data['socialNetworks'] = socialNetworks;
    data['fullName'] = fullName;
    data['nationalId'] = nationalId;
    data['membershipId'] = membershipId;
    data['cif'] = cif;
    if (communicationSettings != null) {
      // data['communicationSettings'] =
      //     this.communicationSettings!.map((v) => v.toJson()).toList();
    }
    if (userPassengers != null) {
      // data['userPassengers'] =
      //     this.userPassengers!.map((v) => v.toJson()).toList();
    }
    if (userCards != null) {
      // data['userCards'] = this.userCards!.map((v) => v.toJson()).toList();
    }
    if (userPrefferedFacilities != null) {
      // data['userPrefferedFacilities'] =
      //     this.userPrefferedFacilities!.map((v) => v.toJson()).toList();
    }
    data['loyaltyDetails'] = loyaltyDetails;
    data['activeCount'] = activeCount;
    data['inActiveCount'] = inActiveCount;
    data['blockedCount'] = blockedCount;
    data['agencyCount'] = agencyCount;
    data['pendingAgencyCount'] = pendingAgencyCount;
    data['maritalStatus'] = maritalStatus;
    data['gender'] = gender;
    data['isPreRegistered'] = isPreRegistered;
    data['passportNumber'] = passportNumber;
    data['userFunctionalRole'] = userFunctionalRole;
    data['pointsFrozen'] = pointsFrozen;
    data['frozenCount'] = frozenCount;
    data['isOTPVerified'] = isOTPVerified;
    data['unFreezeReason'] = unFreezeReason;
    data['freezeReason'] = freezeReason;
    if (loyaltyPrograms != null) {
      // data['loyaltyPrograms'] =
      //     this.loyaltyPrograms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

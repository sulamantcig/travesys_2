class CartResponseModel {
  int? userId;
  String? userSessionId;
  String? cartId;
  String? searchId;
  String? groupId;
  String? supportReferenceNumber;
  bool? isUserCartExist;
  bool? isException;
  Null? exceptionMessage;

  CartResponseModel(
      {this.userId,
      this.userSessionId,
      this.cartId,
      this.searchId,
      this.groupId,
      this.supportReferenceNumber,
      this.isUserCartExist,
      this.isException,
      this.exceptionMessage});

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userSessionId = json['userSessionId'];
    cartId = json['cartId'];
    searchId = json['searchId'];
    groupId = json['groupId'];
    supportReferenceNumber = json['supportReferenceNumber'];
    isUserCartExist = json['isUserCartExist'];
    isException = json['isException'];
    exceptionMessage = json['exceptionMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userSessionId'] = userSessionId;
    data['cartId'] = cartId;
    data['searchId'] = searchId;
    data['groupId'] = groupId;
    data['supportReferenceNumber'] = supportReferenceNumber;
    data['isUserCartExist'] = isUserCartExist;
    data['isException'] = isException;
    data['exceptionMessage'] = exceptionMessage;
    return data;
  }
}

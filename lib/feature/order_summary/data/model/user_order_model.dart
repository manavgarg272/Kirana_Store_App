


import 'package:kirna_store_app/feature/order_summary/data/model/order_summary_model.dart';

class UserOrderPlacedModel{

  final String userId;
  final int totalAmount;
  final String orderStatus;
  final DateTime createdAt;
  final Map<String, OrderSummaryItemModel>  orderList;

  UserOrderPlacedModel({
   required this.orderList,
   required this.totalAmount,
   required this.userId,
   required this.orderStatus,
   required this.createdAt
  });

  factory UserOrderPlacedModel.fromJson(Map<String, dynamic> json) {

    final Map<String, dynamic> orderListJson = json['orderList'];

    final Map<String, OrderSummaryItemModel> orderList = Map.fromEntries(
      orderListJson.entries.map(
        (entry) => MapEntry(entry.key, OrderSummaryItemModel.fromJson(entry.value)),
      ),
    );

    return UserOrderPlacedModel(
      userId: json['userId'],
      totalAmount: json['totalAmount'],
      orderStatus: json['orderStatus'],
      createdAt: json['createdAt']??DateTime.now(),
      orderList: orderList,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> orderListJson = {};
    orderList.forEach((key, value) {
      orderListJson[key] = value.toJson();
    });

    return {
      "userId": userId,
      "totalAmount": totalAmount,
      "orderStatus": orderStatus,
      "orderList": orderListJson,
      "createdAt":createdAt
    };
  }
}








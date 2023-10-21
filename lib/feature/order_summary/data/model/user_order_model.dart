


import 'package:kirna_store_app/feature/order_summary/data/model/order_summary_model.dart';

class UserOrderPlacedModel{

  String userId;
  int totalAmount;
  String orderStatus;
  Map<String, OrderSummaryItemModel>  orderList;

  UserOrderPlacedModel({
   required this.orderList,
   required this.totalAmount,
   required this.userId,
   required this.orderStatus
  });
  Map<String, dynamic> toJson() => {
   "userId":userId,
   "totalAmount":totalAmount,
   "orderList":orderList.values,
   "orderStatus":orderStatus
  };

}
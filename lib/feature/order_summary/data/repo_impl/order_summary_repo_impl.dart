

import 'package:kirna_store_app/feature/order_summary/data/data_source/order_summary_ds.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';
import 'package:kirna_store_app/feature/order_summary/domain/repo/order_summary_repo.dart';

class OrderSummaryRepoImpl  extends OrderSummaryRepo{

 final  OrderSummaryDs orderSummaryDs;
  OrderSummaryRepoImpl({
   required this.orderSummaryDs
  });

  @override
  Future<void> userOrderSummary({required UserOrderPlacedModel userOrderPlacedModel}) {
   return orderSummaryDs.setUserDataToOrderSummary(orderPlacedModel: userOrderPlacedModel);
  }


}


import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';

abstract class OrderSummaryRepo{
  Future<void> userOrderSummary({required UserOrderPlacedModel userOrderPlacedModel});
}
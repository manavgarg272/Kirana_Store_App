import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kirna_store_app/core/services/razorpay_service/interface/payment_response_interface.dart';
import 'package:kirna_store_app/feature/order_summary/data/model/user_order_model.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/manager/order_summary_manager.dart';
import 'package:kirna_store_app/feature/order_summary/presentation/order_success_widget.dart';
import 'package:kirna_store_app/feature/user_details/presentation/manager/location_manager.dart';
import 'package:provider/provider.dart';

class OrderStatusCardWidget implements RazorPayPaymentInterface {
  BuildContext context;
  OrderStatusCardWidget({required this.context});
  @override
  Future<void> handlePaymentFailureBuilderMethod() async {}

  @override
  Future<void> handlePaymentSuccessBuilderMethod() async {
    await context.read<OrderSummaryNotifier>().placeUserOrderToFirebase(
        userOrderPlacedModel: UserOrderPlacedModel(
            createdAt: DateTime.now(),
            locationId: context
                    .read<GetUserLocationNotifier>()
                    .userAddress[0]
                    .locationId ??
                "",
            orderList: context.read<OrderSummaryNotifier>().orderItemData,
            totalAmount: context.read<OrderSummaryNotifier>().orderTotalAmount,
            userId: FirebaseAuth.instance.currentUser!.uid,
            orderStatus: 'INITIATED'));

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return OrderSuccessDialog();
        });
    context.read<OrderSummaryNotifier>().emptyOrderListMap();
  }
}
